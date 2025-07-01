import requests
from bs4 import BeautifulSoup
import csv
import time
from urllib.parse import urljoin, urlparse
import re
from concurrent.futures import ThreadPoolExecutor, as_completed

class MagentoURLChecker:
    def __init__(self, base_url='https://www.mrliving.com.tw', max_workers=5):
        self.base_url = base_url.rstrip('/')
        self.max_workers = max_workers
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        })
        
    def check_url_exists_in_frontend(self, url_path):
        """檢查URL是否在前台存在且可訪問"""
        if not url_path.startswith('/'):
            url_path = '/' + url_path
            
        test_url = self.base_url + url_path
        
        try:
            response = self.session.get(test_url, timeout=10, allow_redirects=True)
            
            if response.status_code == 200:
                # 檢查是否是真正的頁面還是404頁面
                soup = BeautifulSoup(response.text, 'html.parser')
                title = soup.find('title')
                
                # 檢查是否是404頁面的常見特徵
                if title and ('404' in title.get_text() or 'not found' in title.get_text().lower()):
                    return {
                        'status': '404_page',
                        'final_url': response.url,
                        'title': title.get_text().strip(),
                        'redirected': test_url != response.url
                    }
                
                return {
                    'status': 'exists',
                    'final_url': response.url,
                    'title': title.get_text().strip() if title else '',
                    'redirected': test_url != response.url
                }
            
            elif response.status_code == 301 or response.status_code == 302:
                return {
                    'status': f'redirect_{response.status_code}',
                    'final_url': response.url,
                    'title': '',
                    'redirected': True
                }
            
            else:
                return {
                    'status': f'error_{response.status_code}',
                    'final_url': test_url,
                    'title': '',
                    'redirected': False
                }
                
        except Exception as e:
            return {
                'status': 'error',
                'final_url': test_url,
                'title': str(e),
                'redirected': False
            }
    
    def find_references_in_common_pages(self, url_paths):
        """在常見頁面中尋找這些URL的引用"""
        common_pages = [
            '/',  # 首頁
            '/sofas',  # 沙發分類
            '/mattresses',  # 床墊分類
            '/furniture',  # 家具分類
            '/home-decor',  # 家飾分類
            '/dining-tables',  # 餐桌分類
            '/storage-cabinet-furniture',  # 收納櫃
            '/sale',  # 特價頁
            '/new-arrivals',  # 新品頁
        ]
        
        references = {}
        
        for page_url in common_pages:
            try:
                full_url = self.base_url + page_url
                response = self.session.get(full_url, timeout=10)
                
                if response.status_code == 200:
                    soup = BeautifulSoup(response.text, 'html.parser')
                    
                    # 尋找所有連結
                    links = soup.find_all('a', href=True)
                    
                    for link in links:
                        href = link['href']
                        
                        # 標準化URL路徑
                        if href.startswith('http'):
                            parsed = urlparse(href)
                            href = parsed.path
                        elif href.startswith('//'):
                            continue
                        elif not href.startswith('/'):
                            href = '/' + href
                        
                        # 檢查是否匹配我們要找的URL
                        for target_path in url_paths:
                            if target_path.startswith('/'):
                                target_check = target_path
                            else:
                                target_check = '/' + target_path
                                
                            if href == target_check or href == target_check + '.html' or href + '.html' == target_check:
                                if target_path not in references:
                                    references[target_path] = []
                                
                                references[target_path].append({
                                    'found_in_page': page_url,
                                    'link_text': link.get_text().strip(),
                                    'link_href': href,
                                    'full_page_url': full_url
                                })
                
                print(f"已檢查頁面: {page_url}")
                time.sleep(0.5)  # 避免請求過於頻繁
                
            except Exception as e:
                print(f"檢查頁面 {page_url} 時發生錯誤: {e}")
        
        return references
    
    def search_in_sitemap(self, url_paths):
        """在sitemap中尋找這些URL"""
        sitemap_urls = [
            f"{self.base_url}/sitemap.xml",
            f"{self.base_url}/sitemap_products.xml",
            f"{self.base_url}/sitemap_categories.xml",
            f"{self.base_url}/sitemap_pages.xml"
        ]
        
        sitemap_results = {}
        
        for sitemap_url in sitemap_urls:
            try:
                response = self.session.get(sitemap_url, timeout=10)
                if response.status_code == 200:
                    # 解析XML
                    content = response.text
                    
                    for url_path in url_paths:
                        # 構建完整URL來搜尋
                        full_target_url = self.base_url + ('/' + url_path if not url_path.startswith('/') else url_path)
                        
                        if full_target_url in content or full_target_url + '.html' in content:
                            if url_path not in sitemap_results:
                                sitemap_results[url_path] = []
                            sitemap_results[url_path].append(sitemap_url)
                    
                    print(f"已檢查sitemap: {sitemap_url}")
                
            except Exception as e:
                print(f"檢查sitemap {sitemap_url} 時發生錯誤: {e}")
        
        return sitemap_results

def main():
    # 讀取404 URL列表
    url_file = '404_not_found_urls_urls_only.txt'
    
    try:
        with open(url_file, 'r', encoding='utf-8') as f:
            urls = [line.strip() for line in f if line.strip()]
    except FileNotFoundError:
        print(f"找不到檔案: {url_file}")
        return
    
    print(f"讀取到 {len(urls)} 個URL")
    
    # 從URL中提取路徑
    url_paths = []
    for url in urls:
        # 提取路徑部分
        if 'mrliving.tw' in url:
            path = url.split('mrliving.tw')[1] if 'mrliving.tw' in url else url
            url_paths.append(path)
        else:
            url_paths.append(url)
    
    checker = MagentoURLChecker()
    
    print("=== 第一步：檢查URL是否在前台存在 ===")
    
    # 檢查URL是否真的存在於前台
    frontend_results = []
    with ThreadPoolExecutor(max_workers=checker.max_workers) as executor:
        future_to_url = {executor.submit(checker.check_url_exists_in_frontend, path): path for path in url_paths[:10]}  # 先測試前10個
        
        for future in as_completed(future_to_url):
            url_path = future_to_url[future]
            try:
                result = future.result()
                result['url_path'] = url_path
                frontend_results.append(result)
                print(f"檢查 {url_path}: {result['status']}")
            except Exception as e:
                print(f"檢查 {url_path} 時發生錯誤: {e}")
    
    print(f"\n=== 第二步：在常見頁面中尋找引用 ===")
    
    # 只檢查實際存在的URL的引用
    existing_urls = [r['url_path'] for r in frontend_results if r['status'] == 'exists']
    
    if existing_urls:
        references = checker.find_references_in_common_pages(existing_urls)
        
        print(f"\n=== 第三步：在sitemap中尋找 ===")
        sitemap_results = checker.search_in_sitemap(existing_urls)
        
        # 輸出結果
        print("\n=== 檢查結果 ===")
        
        # 保存結果到CSV
        with open('url_frontend_check_results.csv', 'w', newline='', encoding='utf-8-sig') as f:
            writer = csv.writer(f)
            writer.writerow(['URL路徑', '前台狀態', '最終URL', '頁面標題', '是否重定向', '在哪些頁面被引用', '在sitemap中'])
            
            for result in frontend_results:
                url_path = result['url_path']
                
                # 引用信息
                ref_info = []
                if url_path in references:
                    for ref in references[url_path]:
                        ref_info.append(f"{ref['found_in_page']} ({ref['link_text']})")
                
                # Sitemap信息
                sitemap_info = sitemap_results.get(url_path, [])
                
                writer.writerow([
                    url_path,
                    result['status'],
                    result['final_url'],
                    result['title'],
                    result['redirected'],
                    '; '.join(ref_info) if ref_info else '未找到引用',
                    '; '.join(sitemap_info) if sitemap_info else '不在sitemap中'
                ])
        
        print("結果已保存到: url_frontend_check_results.csv")
        
        # 顯示摘要
        status_count = {}
        for result in frontend_results:
            status = result['status']
            status_count[status] = status_count.get(status, 0) + 1
        
        print(f"\n=== 狀態統計 ===")
        for status, count in status_count.items():
            print(f"{status}: {count}")
        
        if references:
            print(f"\n=== 找到引用的URL ===")
            for url_path, refs in references.items():
                print(f"\n{url_path}:")
                for ref in refs:
                    print(f"  - 在 {ref['found_in_page']} 頁面中被引用")
                    print(f"    連結文字: {ref['link_text']}")
    
    else:
        print("沒有找到存在於前台的URL")

if __name__ == "__main__":
    main()
