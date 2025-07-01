import requests
from bs4 import BeautifulSoup
import csv
from concurrent.futures import ThreadPoolExecutor, as_completed
import time
from urllib.parse import urljoin, urlparse
import urllib3

# 禁用SSL警告（開發環境可能有SSL問題）
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def check_url_status(url, base_url=None):
    try:
        if base_url and not url.startswith(('http://', 'https://')):
            url = urljoin(base_url, url)
            
        # 增加session和更寬鬆的設定
        session = requests.Session()
        session.headers.update({
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        })
        
        response = session.get(url, timeout=20, verify=False, allow_redirects=True)
        
        # 更細緻的狀態判斷
        if response.status_code == 404:
            return {
                'url': url,
                'status': '404_not_found',
                'h1_text': None,
                'error': f'404 Not Found',
                'status_code': response.status_code
            }
        elif response.status_code >= 500:
            return {
                'url': url,
                'status': 'server_error',
                'h1_text': None,
                'error': f'Server Error: {response.status_code}',
                'status_code': response.status_code
            }
        elif 200 <= response.status_code < 400:
            # 200-399 都視為可訪問
            soup = BeautifulSoup(response.text, 'html.parser')
            h1_tags = soup.find_all('h1')
            h1_texts = [h1.text.strip() for h1 in h1_tags]
            
            return {
                'url': url,
                'status': 'accessible',
                'h1_text': h1_texts[0] if h1_texts else 'No H1 found',
                'error': None,
                'status_code': response.status_code
            }
        else:
            # 其他狀態碼
            return {
                'url': url,
                'status': 'client_error',
                'h1_text': None,
                'error': f'Client Error: {response.status_code}',
                'status_code': response.status_code
            }
        
    except requests.exceptions.Timeout:
        return {
            'url': url,
            'status': 'timeout',
            'h1_text': None,
            'error': 'Request timeout',
            'status_code': None
        }
    except requests.exceptions.ConnectionError:
        return {
            'url': url,
            'status': 'connection_error',
            'h1_text': None,
            'error': 'Connection error',
            'status_code': None
        }
    except Exception as e:
        return {
            'url': url,
            'status': 'unknown_error',
            'h1_text': None,
            'error': str(e),
            'status_code': None
        }

def check_multiple_urls(urls, base_url=None, max_workers=10):  # 降低併發數
    results = []
    
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        future_to_url = {executor.submit(check_url_status, url, base_url): url 
                         for url in urls}
        
        for future in as_completed(future_to_url):
            result = future.result()
            results.append(result)
            print(f"已檢查: {result['url']} - 狀態: {result['status']} - HTTP: {result.get('status_code', 'N/A')}")
            
            # 添加小延遲避免過於頻繁的請求
            time.sleep(0.1)
    
    return results

# 保存結果到csv
def save_results_to_csv(results, filename='check_results.csv'):
    with open(filename, 'w', newline='', encoding='utf-8-sig') as csvfile:
        fieldnames = ['url', 'status', 'h1_text', 'error', 'status_code']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        
        writer.writeheader()
        for result in results:
            writer.writerow(result)
    
    print(f"\n結果已保存到 {filename}")


if __name__ == "__main__":
    # 正確讀取CSV文件的page_url欄位
    urls_to_check = []
    with open('catalog_product_entity.csv', 'r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            if 'page_url' in row and row['page_url']:
                urls_to_check.append(row['page_url'].strip())
    
    print(f"開始檢查 {len(urls_to_check)} 個URL...")
    start_time = time.time()
    
    # 添加基礎網址
    base_url = 'http://dev-release-m2v243.mrliving.tw'  # 修改為你的網站網址
    results = check_multiple_urls(urls_to_check, base_url, max_workers=10)
    
    # 統計結果
    accessible_count = sum(1 for r in results if r['status'] == 'accessible')
    not_found_count = sum(1 for r in results if r['status'] == '404_not_found')
    server_error_count = sum(1 for r in results if r['status'] == 'server_error')
    other_error_count = sum(1 for r in results if r['status'] not in ['accessible', '404_not_found', 'server_error'])
    
    print(f"\n檢查完成！耗時: {time.time() - start_time:.2f} 秒")
    print(f"總共檢查: {len(results)} 個頁面")
    print(f"✅ 可正常訪問: {accessible_count} 個")
    print(f"❌ 404錯誤: {not_found_count} 個")
    print(f"🔥 服務器錯誤: {server_error_count} 個")
    print(f"⚠️  其他錯誤: {other_error_count} 個")
    
    # 保存結果
    save_results_to_csv(results)
    
    # 分類顯示錯誤
    print("\n=== 404 Not Found ===")
    for result in results:
        if result['status'] == '404_not_found':
            print(f"- {result['url']}")
    
    print("\n=== 服務器錯誤 ===")
    for result in results:
        if result['status'] == 'server_error':
            print(f"- {result['url']} (HTTP {result.get('status_code', 'N/A')})")
    
    print("\n=== 其他錯誤 ===")
    for result in results:
        if result['status'] not in ['accessible', '404_not_found', 'server_error']:
            print(f"- {result['url']} ({result['status']}: {result['error']})")