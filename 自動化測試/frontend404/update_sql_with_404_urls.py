#!/usr/bin/env python3
"""
Script to update 404_in_site.sql with URLs from 404_not_found_urls_urls_only.txt
"""

def read_404_urls(file_path):
    """讀取 404 URL 文件並返回 URL 列表"""
    urls = []
    with open(file_path, 'r', encoding='utf-8') as f:
        for line in f:
            url = line.strip()
            if url and url.startswith('/'):
                # 移除開頭的 / 來匹配 SQL 中的格式
                urls.append(url[1:])
            elif url:
                urls.append(url)
    return urls

def generate_url_list_cte(urls):
    """生成完整的 url_list CTE"""
    statements = ["WITH url_list AS ("]
    
    for i, url in enumerate(urls):
        # 轉義單引號
        escaped_url = url.replace("'", "''")
        
        if i == 0:
            statements.append(f"    SELECT '{escaped_url}' AS url UNION ALL")
        elif i == len(urls) - 1:
            # 最後一個不需要 UNION ALL
            statements.append(f"    SELECT '{escaped_url}'")
        else:
            statements.append(f"    SELECT '{escaped_url}' UNION ALL")
    
    statements.append(")")
    return '\n'.join(statements)

def update_sql_file(sql_file_path, new_urls):
    """更新 SQL 文件，替換整個 url_list"""
    
    # 讀取現有的 SQL 文件
    with open(sql_file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 找到 WITH url_list AS 的開始和結束位置
    lines = content.split('\n')
    
    start_idx = -1
    end_idx = -1
    
    for i, line in enumerate(lines):
        if 'WITH url_list AS (' in line:
            start_idx = i
        elif start_idx != -1 and line.strip() == ')' and i > start_idx:
            end_idx = i
            break
    
    if start_idx == -1 or end_idx == -1:
        print("無法找到 url_list CTE 的開始或結束位置")
        return False
    
    # 生成新的 url_list CTE
    new_url_list = generate_url_list_cte(new_urls)
    
    # 替換舊的 url_list
    new_lines = lines[:start_idx] + new_url_list.split('\n') + lines[end_idx + 1:]
    
    # 寫回文件
    with open(sql_file_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(new_lines))
    
    return True

def main():
    """主函數"""
    # 文件路徑
    urls_file = '404_not_found_urls_urls_only.txt'
    sql_file = '404_in_site.sql'
    
    try:
        # 讀取 404 URL
        print(f"讀取 {urls_file}...")
        urls = read_404_urls(urls_file)
        print(f"找到 {len(urls)} 個 URL")

        # 更新 SQL 文件
        print(f"更新 {sql_file}...")
        
        if update_sql_file(sql_file, urls):
            print("成功更新 SQL 文件!")
            print(f"已將 {len(urls)} 個 URL 添加到 url_list 中")
        else:
            print("更新 SQL 文件失敗!")
            
    except Exception as e:
        print(f"錯誤: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 