import requests
from bs4 import BeautifulSoup
import time

# Webhook URL 配置
webhook_url = "https://chat.googleapis.com/v1/spaces/AAAA0Wr2GQg/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=xZ_ySyXbOulo-pmofM5KVw6Q2LXz_pItQvLnU08lPW8"

# 網站基本URL
base_url = "https://dev-m2v243.mrliving.tw/"

# 要檢查的URL列表 - 從你提供的URL列表生成
category_paths = [
    "topsales.html",
    "diningroom-festival.html",
    "diningroom-festival/dining-styles-festival.html",
    "diningroom-festival/dining-styles-festival/dining-styles01-festival.html",
    "diningroom-festival/dining-styles-festival/dining-styles03-festival.html",
    "diningroom-festival/dining-styles-festival/dining-styles02-festival.html",
    "diningroom-festival/dining-styles-festival/dining-styles04-festival.html",
    "diningroom-festival/dining-styles-festival/dining-styles05-festival.html",
    "lighting.html",
    "lighting/lights-groups.html",
    "lighting/lights-groups/lights-groups-pendant.html",
    "lighting/lights-groups/lights-group-tablelamp.html",
    "lighting/lights-groups/lights-group-wall.html",
    "lighting/lights-groups/lights-group-floor.html",
    "storage-cabinet-furniture.html",
    "livesale.html",
    "furniture.html",
    "furniture/mattress-category.html",
    "mattress-category.html",
    "furniture/mattress-category/mrl-mattress.html",
    "mattress-category/mrl-mattress.html",
    "furniture/mattress-category/mrl-pillow.html",
    "mattress-category/mrl-pillow.html",
    "furniture/mattress-category/mrl-quilt-sheet.html",
    "mattress-category/mrl-quilt-sheet.html",
    "furniture/mattress-category/greatliving.html",
    "mattress-category/greatliving.html",
    "furniture/mattress-category/greatliving/greatliving-bedset.html",
    "furniture/mattress-category/greatliving/greatliving-tencel-single.html",
    "furniture/mattress-category/bed-single.html",
    "mattress-category/bed-single.html",
    "furniture/mattress-category/bed-singlemax.html",
    "mattress-category/bed-singlemax.html",
    "furniture/mattress-category/bed-double.html",
    "mattress-category/bed-double.html",
    "furniture/mattress-category/bed-queen.html",
    "mattress-category/bed-queen.html",
    "furniture/mattress-category/bed-king.html",
    "mattress-category/bed-king.html",
    "furniture/livingroom.html",
    "furniture/livingroom/livingroom-sofas.html",
    "furniture/livingroom/livingroom-1ssofa-footstools.html",
    "furniture/livingroom/livingroom-coffeetable.html",
    "furniture/livingroom/livingroom-tvstands.html",
    "furniture/livingroom/livingroom-storagecabinet.html",
    "furniture/bedroom.html",
    "furniture/bedroom/bedroom-bed.html",
    "furniture/bedroom/bedroom-bed/bedframe-double.html",
    "furniture/bedroom/bedroom-bed/bedframe-queen.html",
    "furniture/bedroom/mrliving-bedside-cabinet.html",
    "furniture/bedroom/bedroom-dressingtable-chair.html",
    "furniture/bedroom/bedroom-storage.html",
    "furniture/diningroom.html",
    "furniture/diningroom/diningroom-table.html",
    "furniture/diningroom/diningroom-table/diningtable-160cm.html",
    "furniture/diningroom/diningroom-table/diningtable-180cm.html",
    "furniture/diningroom/diningroom-chairs.html",
    "furniture/diningroom/diningroom-counterstool.html",
    "furniture/diningroom/diningroom-storage.html",
    "furniture/studyroom.html",
    "furniture/studyroom/studyroom-table.html",
    "furniture/studyroom/studyroom-chair.html",
    "furniture/studyroom/studyroom-bookcase.html",
    "furniture/nordic-lighting.html",
    "hotsales.html",
    "hotsales/mcm-series.html",
    "hotsales/mcm-series/mcm-livingroom.html",
    "hotsales/mcm-series/mcm-bedroom.html",
    "hotsales/mcm-series/mcm-diningroom.html",
    "hotsales/mcm-series/mcm-storage.html",
    "hotsales/nordic-series.html",
    "hotsales/loft-series.html",
    "hotsales/carrara-series.html",
    "hotsales/light-luxury-series.html",
    "hotsales/audrey-series.html",
    "audrey-series.html",
    "sofas.html",
    "sofas/style.html",
    "sofas/style/sofa-pet-friendly.html",
    "sofas/style/nordic-style.html",
    "sofas/style/leather-sofa.html",
    "sofas/style/country-style.html",
    "sofas/size.html",
    "sofas/size/l-corner-sofas.html",
    "sofas/size/3-seater-sofas.html",
    "sofas/size/2-seater-sofas.html",
    "sofas/size/chairs.html",
    "sofas/size/mrl-footstools.html",
    "sofas/hot-nordic-series.html",
    "sofas/hot-nordic-series/jaspersofa-pet-friendly.html",
    "sofas/hot-nordic-series/brucesofa-pet-friendly.html",
    "sofas/hot-nordic-series/bryant-series.html",
    "sofas/hot-nordic-series/ben-series.html",
    "sofas/hot-nordic-series/bulls-series.html",
    "test-test-test.html",
    "antony-series.html",
    "arthur-series.html",
    "charles-series.html",
    "joyce-series.html",
    "sofa-fur.html",
    "stocking-furnitures.html",
    "stocking-furnitures/stocking-studyroom.html",
    "stocking-furnitures/stocking-storage-furniture.html",
    "stocking-furnitures/stocking-lighting.html",
    "stocking-furnitures/stocking-livingroom.html",
    "stocking-furnitures/stocking-bedroom.html",
    "stocking-furnitures/stocking-diningroom.html",
]

# 生成完整的URL列表
urls_to_check = [base_url + path for path in category_paths]

# 初始化統計
all_results = set()
processed_count = 0
total_urls = len(urls_to_check)

# 設定請求頭，模擬瀏覽器請求
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
}

# 批次處理，每批處理數量
batch_size = 50
current_batch = 1
total_batches = (total_urls + batch_size - 1) // batch_size

print(f"總共需要檢查 {total_urls} 個URL，分為 {total_batches} 批處理")

# 依批次處理
for i in range(0, total_urls, batch_size):
    batch_urls = urls_to_check[i:i+batch_size]
    print(f"\n開始處理第 {current_batch}/{total_batches} 批 ({len(batch_urls)} 個URL)")
    
    # 處理當前批次的URL
    for url in batch_urls:
        processed_count += 1
        print(f"[{processed_count}/{total_urls}] 檢查URL: {url}")
        
        # 載入頁面
        try:
            response = requests.get(url, headers=headers, timeout=15)
            if response.status_code != 200:
                print(f"  載入失敗，狀態碼: {response.status_code}")
                all_results.add(f"{url} - HTTP狀態碼: {response.status_code}")
                continue
            
            # 解析頁面內容
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # 檢查meta標籤中的title是否包含404
            title_element = soup.find('meta', attrs={"name": "title"})
            if title_element:
                title = title_element.get('content', '')
                if "404" in title:
                    print(f"  發現標題含404: {title}")
                    all_results.add(f"{url} - 標題含404: {title}")
                    continue
            
            # 檢查HTML標題是否包含404
            title_tag = soup.find('title')
            if title_tag and "404" in title_tag.text:
                print(f"  發現HTML標題含404: {title_tag.text}")
                all_results.add(f"{url} - HTML標題含404: {title_tag.text}")
                continue
                
            print("  頁面正常")
            
        except Exception as e:
            print(f"  檢查時發生錯誤: {str(e)}")
            all_results.add(f"{url} - 錯誤: {str(e)}")
        
        # 避免請求過於頻繁
        time.sleep(0.5)
    
    current_batch += 1
    
    print(f"完成第 {current_batch-1}/{total_batches} 批，目前共發現 {len(all_results)} 個問題")
    
    # 避免網站阻擋
    if current_batch <= total_batches:
        print("休息5秒後繼續下一批...")
        time.sleep(5)

# result ready
if all_results:
    final_message = f"404 頁面檢查結果 ({len(all_results)}/{total_urls}): \n" + "\n".join(sorted(all_results))
else:
    final_message = "沒有發現 404 頁面，所有 URL 都正常"

# 打印結果
print("\n" + "="*50)
print(final_message)
print("="*50)

# 如果結果過大，可能需要分段發送
max_message_length = 4000
if len(final_message) > max_message_length:
    message_parts = [final_message[i:i+max_message_length] 
                    for i in range(0, len(final_message), max_message_length)]
    
    for i, part in enumerate(message_parts):
        message = {"text": f"報告 ({i+1}/{len(message_parts)}):\n{part}"}
        response = requests.post(webhook_url, json=message)
        if response.status_code != 200:
            print(f"發送 Webhook 通知失敗，狀態碼: {response.status_code}")
        time.sleep(1)
else:
    # 發送通知到chat
    message = {"text": final_message}
    response = requests.post(webhook_url, json=message)
    if response.status_code != 200:
        print(f"發送 Webhook 通知失敗，狀態碼: {response.status_code}")
        print(f"response: {response.text}")
    else:
        print("Webhook 通知發送成功")