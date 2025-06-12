#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
from bs4 import BeautifulSoup
import time
import logging
from datetime import datetime

# 設定 logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('crawler.log'),
        logging.StreamHandler()
    ]
)

def main():
    try:
        logging.info("Crawler started")
        # 在這裡加入您的爬蟲邏輯
        
        while True:
            try:
                # 主要的爬蟲邏輯
                current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                logging.info(f"Running at {current_time}")
                
                # 在這裡加入您的爬蟲程式碼
                
                # 等待一小時
                time.sleep(3600)  # 3600 秒 = 1 小時
                
            except Exception as e:
                logging.error(f"Error occurred: {str(e)}")
                time.sleep(300)  # 發生錯誤時等待 5 分鐘後重試
                
    except KeyboardInterrupt:
        logging.info("Crawler stopped by user")
    except Exception as e:
        logging.error(f"Fatal error: {str(e)}")

if __name__ == "__main__":
    main() 