import requests
from bs4 import BeautifulSoup
from urllib.parse import urlparse
import time

# webhook_url = "https://chat.googleapis.com/v1/spaces/AAAASuBT-MM/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=FWrSRi88ee_5nQtUqnVNv3us1XBb2qdCYSL0UsIzoJE"

webhook_url = "https://chat.googleapis.com/v1/spaces/AAAA0Wr2GQg/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=xZ_ySyXbOulo-pmofM5KVw6Q2LXz_pItQvLnU08lPW8"

base_url = "https://www.mrliving.com.tw/affordable-sofa-furniture-picks.html"

page_count = 1

all_results = set()

while True:
    print(f"----------目前是第 {page_count} 頁----------")

    current_url = f"{base_url}?p={page_count}"
    
    # 載入頁面
    response = requests.get(current_url)
    if response.status_code != 200:
        print(f"載入失敗，state: {response.status_code}")
        break
    
    # 解析页面内容
    soup = BeautifulSoup(response.text, 'html.parser')
    
    # 查找所有商品 SKU和價格
    sku_elements = soup.find_all(attrs={"data-mrlsku": True})
    if not sku_elements:
        print("沒有找到更多商品")
        break
    
    sku_price_list = []
    skus = []
    
    for sku_element in sku_elements:
        sku = sku_element['data-mrlsku']
        price_element = sku_element.find(class_="price")
        price = price_element.text.strip() if price_element else "0"
        sku_price_list.append({"sku": sku, "price": price})
        skus.append(sku)
    
    # API payload
    payload = {
        "pids": ",".join(skus),
        "fields": "sku,MRL_discount_price",
        "page": 1,
        "page_size": 30
    }
    
    parsed_url = urlparse(current_url)
    domain = f"{parsed_url.scheme}://{parsed_url.netloc}"
    
    # API request
    api_response = requests.post(
        f"{domain}/index.php/rest/V1/api/mrl/products/list",
        json=payload
    )
    
    if api_response.status_code == 200:
        api_data = api_response.json()
        if api_data[0]['status']:
            api_items = api_data[0]['data']['items']

            for item in sku_price_list:
                sku = item['sku']
                page_price = int(item['price'].replace('$', "").replace(",", ""))
                api_item = next((x for x in api_items if x['sku'] == sku), None)
                # 比較前後台資料
                if api_item:
                    api_price = int(float(api_item["MRL_discount_price"]))
                    if api_price == 0:
                        result = f"{sku} Page_Price: {page_price} Backend Price: {api_price} 無折扣價格\n"
                        print(result)
                    elif page_price != api_price:
                        result = f"{sku} Page_Price: {page_price} Backend Price: {api_price} 資料不同\n"
                        print(result)
                    else:
                        result = f"{sku} Page_Price: {page_price} Backend Price: {api_price} 資料相同\n"
                        print(result)

                    if page_price != api_price and api_price != 0:
                        result = f"{sku} Page_Price: {page_price} Backend Price: {api_price} 資料不同\n"
                    else:
                        result = "恭喜恭喜！！前後端資料都一樣喔！！！！"
                else:
                    result = f"SKU: {sku} no response data\n"
                
                all_results.add(result)
        else:
            print(f"API return error: {api_data[0]['error']}")
    else:
        print(f"API get data failed, status code: {api_response.status_code}")

    if not sku_elements:
        final_message = "前後台商品價格比對結果: \n" + "\n".join(all_results)

        # 發送通知到chat
        message = {"text": final_message}
        response = requests.post(webhook_url, json=message)
        print(f"response: {response.text}")
        if response.status_code != 200:
            print(f"發送 Webhook 通知失敗，狀態碼: {response.status_code}")
            print(f"response: {response.text}")
        break

    page_count += 1

    # 等待5秒重複執行
    time.sleep(5)


final_message = "商品價格比對結果: \n" + "\n".join(all_results)

# 發送通知到chat
message = {"text": final_message}
response = requests.post(webhook_url, json=message)
if response.status_code != 200:
    print(f"發送 Webhook 通知失敗，狀態碼: {response.status_code}")
    print(f"response: {response.text}")
else:
    print("Webhook 通知發送成功")