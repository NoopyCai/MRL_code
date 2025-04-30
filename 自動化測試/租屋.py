import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse
import time

webhook_url = "https://chat.googleapis.com/v1/spaces/AAAA0Wr2GQg/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=xZ_ySyXbOulo-pmofM5KVw6Q2LXz_pItQvLnU08lPW8"

page_count = 1

# 假設 base_url 是你的 API 或網頁的基本 URL
base_url = "https://rent.591.com.tw/list?kind=2&region=3"

# 定義城市和價格篩選條件
cities = ["新北市"]
max_price = 15000

all_results = set()

for city in cities:
    page_count = 1
    while True:
        print(f"查詢 {city} 的第 {page_count} 頁")

        # 構建查詢 URL，假設 API 支持城市和頁數作為參數
        current_url = f"{base_url}?city={city}&page={page_count}"

        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
        }
        
        # 載入頁面
        response = requests.get(current_url, headers=headers)
        if response.status_code != 200:
            print(f"載入失敗，state: {response.status_code}")
            break
        
        # 解析页面内容
        soup = BeautifulSoup(response.text, 'html.parser')
        print(soup.prettify())
        break;
        
        # 查找所有套房信息
        # print(f"response.text: {response.text}")
        apartment_elements = soup.find_all(class_="item")

        if not apartment_elements:
            print(f"{city} 沒有找到更多套房")
            break
        
        for apartment in apartment_elements:
            title_element = apartment.find(class_="item-info-title")
            print(f"title_element: {title_element}")
            if title_element :
                title = title_element.text.strip() if title_element else "無標題"
                result = f"{city} - {title}\n"
                all_results.add(result)

        # page_count += 1
        if page_count == 1:
            break
        time.sleep(1)

# 循環結束後發送通知
final_message = "符合條件的套房:\n" + "".join(all_results)

# 發送通知到chat
message = {"text": final_message}
response = requests.post(webhook_url, json=message)
if response.status_code != 200:
    print(f"發送 Webhook 通知失敗，狀態碼: {response.status_code}")
    print(f"響應內容: {response.text}")
else:
    print("Webhook 通知發送成功")
