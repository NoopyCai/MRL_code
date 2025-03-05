from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from urllib.parse import urlparse
import time
import requests

# set chromedriver path
chrome_driver_path = "/Users/mrl/Downloads/chromedriver-mac-x64/chromedriver"

# create ChromeOptions object
chrome_options = webdriver.ChromeOptions()
# chrome_options.add_argument("--headless")
# initialize WebDriver
driver = webdriver.Chrome(service=Service(chrome_driver_path), options=chrome_options)

# 打開分類頁
driver.get("https://www.mrliving.com.tw/affordable-sofa-furniture-picks.html")

page_count = 1

try:
    while True:
        print(f"----------目前是第 {page_count} 頁----------")
        # wait until data-mrlsku element loaded
        WebDriverWait(driver, 20).until(
            EC.presence_of_element_located((By.XPATH, "//*[@data-mrlsku]"))
        )
        
        sku_elements = driver.find_elements(By.XPATH, "//*[@data-mrlsku]")
        
        # 頁面商品&價格  
        sku_price_list = []
        skus = []

        # 比對後價格不同的商品
        diff_price_list = []
        
        for sku_element in sku_elements:
            sku = sku_element.get_attribute("data-mrlsku")
            # 價格在子元素中
            price_element = sku_element.find_element(By.CLASS_NAME, "price")
            price = price_element.text.strip()
            sku_price_list.append({"sku": sku, "price": price})
            skus.append(sku)
        
         # API payload
        payload = {
            "pids": ",".join(skus),
            "fields": "sku,MRL_discount_price",
            "page": 1,
            "page_size": 30
        }
        # 獲取當前頁面的完整 URL
        current_url = driver.current_url

        # 解析 URL 並提取 domain
        parsed_url = urlparse(current_url)
        domain = f"{parsed_url.scheme}://{parsed_url.netloc}"

        response = requests.post(
            f"{domain}/index.php/rest/V1/api/mrl/products/list",
            json=payload
        )

        # check request success
        if response.status_code == 200:
            api_data = response.json()
            if api_data[0]['status']:
                api_items = api_data[0]['data']['items']
                # compare API data with page data
                for item in sku_price_list:
                    sku = item['sku']
                    page_price = int(item['price'].replace('$', "").replace(",", ""))
                    # find SKU in API data
                    api_item = next((x for x in api_items if x['sku'] == sku), None)
                    if api_item:
                        api_price = int(float(api_item["MRL_discount_price"]))
                        if api_price == 0:
                            print(f"\033[92m{sku}\033[0m Page_Price:\033[93m{page_price}\033[0m Backend Price:\033[93m{api_price}\033[0m",  "無折扣價格")
                        elif page_price != api_price:
                            print(f"\033[92m{sku}\033[0m Page_Price:\033[93m{page_price}\033[0m Backend Price:\033[93m{api_price}\033[0m",  "資料不同")
                        else:
                            print(f"\033[92m{sku}\033[0m Page_Price:\033[93m{page_price}\033[0m Backend Price:\033[93m{api_price}\033[0m",  "資料相同")
                    else:
                        print(f"SKU: {sku} no response data")
            else:
                print(f"API return error: {api_data[0]['error']}")        
        else:
            print(f"API get data failed, status code: {response.status_code}")

        # find next page button
        try:
            next_button = WebDriverWait(driver, 30).until(
                EC.element_to_be_clickable((By.XPATH, "//a[contains(@class, 'action') and contains(@class, 'next')]"))
            )
            next_button.click()
            # wait page loaded
            time.sleep(3)
            page_count += 1
        except Exception as e:
             print("分類頁结束，共加载了", page_count, "頁", e)
             break
finally:
    # 比對後不同價格的商品
    if diff_price_list:
        print("商品價格與後端資料不同的商品: ", diff_price_list)
    else:
        print("所有商品價格與後端資料相同")
    
    # shutdown driver
    driver.quit()