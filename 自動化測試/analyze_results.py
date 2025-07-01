import csv
import pandas as pd
from collections import Counter
import os

def analyze_csv_results(csv_file):
    """分析CSV檢查結果"""
    if not os.path.exists(csv_file):
        print(f"檔案 {csv_file} 不存在")
        return
    
    # 使用pandas讀取CSV
    try:
        df = pd.read_csv(csv_file, encoding='utf-8-sig')
        print(f"已讀取檔案: {csv_file}")
        print(f"總記錄數: {len(df)}")
        print("="*50)
        
        # 狀態統計
        status_counts = df['status'].value_counts()
        print("狀態統計:")
        for status, count in status_counts.items():
            percentage = count / len(df) * 100
            print(f"  {status}: {count} 個 ({percentage:.1f}%)")
        print()
        
        # 錯誤類型分析
        if 'error' in df.columns:
            error_df = df[df['status'] == 'error']
            if len(error_df) > 0:
                print("錯誤類型分析:")
                # 提取錯誤的主要類型
                error_types = []
                for error in error_df['error'].dropna():
                    if '404' in str(error):
                        error_types.append('404 Not Found')
                    elif 'timeout' in str(error).lower():
                        error_types.append('Timeout')
                    elif 'connection' in str(error).lower():
                        error_types.append('Connection Error')
                    else:
                        error_types.append('Other Error')
                
                error_counter = Counter(error_types)
                for error_type, count in error_counter.most_common():
                    print(f"  {error_type}: {count} 個")
                print()
        
        # 已售完商品
        sold_out_df = df[df['status'] == 'sold_out']
        if len(sold_out_df) > 0:
            print(f"已售完商品 ({len(sold_out_df)} 個):")
            for url in sold_out_df['url']:
                print(f"  - {url}")
            print()
        
        # 可用商品樣本
        available_df = df[df['status'] == 'available']
        if len(available_df) > 0:
            print(f"可用商品樣本 (前10個，共{len(available_df)}個):")
            for i, (_, row) in enumerate(available_df.head(10).iterrows()):
                h1_text = row['h1_text'] if pd.notna(row['h1_text']) else 'N/A'
                print(f"  {i+1}. {row['url']}")
                print(f"     標題: {h1_text}")
            if len(available_df) > 10:
                print(f"  ... 還有 {len(available_df)-10} 個可用商品")
            print()
        
        # 域名統計
        print("域名統計:")
        domains = []
        for url in df['url']:
            try:
                from urllib.parse import urlparse
                domain = urlparse(str(url)).netloc
                domains.append(domain)
            except:
                domains.append('Unknown')
        
        domain_counter = Counter(domains)
        for domain, count in domain_counter.most_common():
            print(f"  {domain}: {count} 個")
        
    except Exception as e:
        print(f"分析檔案時出錯: {e}")

def export_summary(csv_file, output_file='analysis_summary.txt'):
    """匯出分析摘要到文字檔"""
    try:
        df = pd.read_csv(csv_file, encoding='utf-8-sig')
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(f"URL檢查結果分析報告\n")
            f.write(f"="*50 + "\n")
            f.write(f"檔案: {csv_file}\n")
            f.write(f"總記錄數: {len(df)}\n\n")
            
            # 狀態統計
            status_counts = df['status'].value_counts()
            f.write("狀態統計:\n")
            for status, count in status_counts.items():
                percentage = count / len(df) * 100
                f.write(f"  {status}: {count} 個 ({percentage:.1f}%)\n")
            f.write("\n")
            
            # 已售完商品清單
            sold_out_df = df[df['status'] == 'sold_out']
            if len(sold_out_df) > 0:
                f.write(f"已售完商品清單 ({len(sold_out_df)} 個):\n")
                for url in sold_out_df['url']:
                    f.write(f"  - {url}\n")
                f.write("\n")
            
            # 錯誤商品清單（前50個）
            error_df = df[df['status'] == 'error']
            if len(error_df) > 0:
                f.write(f"錯誤商品清單 (前50個，共{len(error_df)}個):\n")
                for i, (_, row) in enumerate(error_df.head(50).iterrows()):
                    f.write(f"  {i+1}. {row['url']} - {row['error']}\n")
                f.write("\n")
        
        print(f"分析摘要已匯出到: {output_file}")
        
    except Exception as e:
        print(f"匯出摘要時出錯: {e}")

if __name__ == "__main__":
    # 分析現有的結果檔案
    csv_files = ['check_results.csv', 'check_results_improved.csv']
    
    for csv_file in csv_files:
        if os.path.exists(csv_file):
            print(f"\n分析檔案: {csv_file}")
            print("="*60)
            analyze_csv_results(csv_file)
            export_summary(csv_file, f"analysis_{csv_file.replace('.csv', '.txt')}")
        else:
            print(f"檔案 {csv_file} 不存在") 