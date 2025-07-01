import csv
import pandas as pd

def filter_404_urls(input_file, output_file='404_urls_only_250623.csv'):
    """
    過濾CSV檔案，只保留包含 'Client Error: Not Found for url' 錯誤的URL
    """
    try:
        # 讀取CSV檔案
        df = pd.read_csv(input_file, encoding='utf-8-sig')
        print(f"原始檔案總共有 {len(df)} 筆記錄")
        
        # 過濾條件：error欄位包含 "404"
        filtered_df = df[df['error'].str.contains('404', na=False)]
        
        print(f"過濾後有 {len(filtered_df)} 筆404錯誤記錄")
        
        # 如果有結果才儲存
        if len(filtered_df) > 0:
            # 保存過濾後的結果
            filtered_df.to_csv(output_file, index=False, encoding='utf-8-sig')
            print(f"已將404錯誤URL保存到: {output_file}")
            
            # 顯示統計資訊
            print(f"\n統計資訊:")
            print(f"- 404錯誤數量: {len(filtered_df)}")
            print(f"- 錯誤率: {len(filtered_df)/len(df)*100:.1f}%")
            
            # 顯示前10個404 URL
            print(f"\n前10個404錯誤URL:")
            for i, url in enumerate(filtered_df['url'].head(10)):
                print(f"  {i+1}. {url}")
            
            if len(filtered_df) > 10:
                print(f"  ... 還有 {len(filtered_df)-10} 個404錯誤URL")
            
            # 如果需要，也可以只提取URL列表保存為純文字檔
            url_only_file = output_file.replace('.csv', '_urls_only.txt')
            with open(url_only_file, 'w', encoding='utf-8') as f:
                for url in filtered_df['url']:
                    f.write(f"{url}\n")
            print(f"\n純URL列表已保存到: {url_only_file}")
            
        else:
            print("沒有找到404錯誤的記錄")
            
    except Exception as e:
        print(f"處理檔案時出錯: {e}")

def show_error_types(input_file):
    """
    顯示所有錯誤類型的統計
    """
    try:
        df = pd.read_csv(input_file, encoding='utf-8-sig')
        
        # 過濾出所有錯誤記錄
        error_df = df[df['status'] == 'error']
        
        print(f"錯誤類型分析 (共 {len(error_df)} 個錯誤):")
        print("="*50)
        
        # 統計不同錯誤類型
        error_types = {}
        for error in error_df['error'].dropna():
            error_str = str(error)
            if '404 Client Error: Not Found' in error_str:
                error_types['404 Not Found'] = error_types.get('404 Not Found', 0) + 1
            elif 'timeout' in error_str.lower():
                error_types['Timeout'] = error_types.get('Timeout', 0) + 1
            elif 'connection' in error_str.lower():
                error_types['Connection Error'] = error_types.get('Connection Error', 0) + 1
            elif 'name resolution' in error_str.lower():
                error_types['DNS Resolution Error'] = error_types.get('DNS Resolution Error', 0) + 1
            else:
                error_types['Other Error'] = error_types.get('Other Error', 0) + 1
        
        for error_type, count in sorted(error_types.items(), key=lambda x: x[1], reverse=True):
            percentage = count / len(error_df) * 100
            print(f"  {error_type}: {count} 個 ({percentage:.1f}%)")
            
    except Exception as e:
        print(f"分析錯誤類型時出錯: {e}")

if __name__ == "__main__":
    input_file = 'check_results.csv'
    
    # 先顯示所有錯誤類型
    print("原始檔案錯誤分析:")
    show_error_types(input_file)
    
    print("\n" + "="*60)
    print("開始過濾404錯誤...")
    
    # 過濾404錯誤
    filter_404_urls(input_file, '404_not_found_urls.csv') 