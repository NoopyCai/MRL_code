from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import requests
import time
import schedule

def 檢查按鈕():
    # 設定 Chrome 瀏覽器選項
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')  # 無頭模式運行
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    
    try:
        # 初始化瀏覽器
        driver = webdriver.Chrome(options=options)
        # 訪問目標網頁
        driver.get('https://kktix.com/events/58652d0a/registrations/new')
        
        # 等待並檢查按鈕是否存在
        wait = WebDriverWait(driver, 10)
        button = wait.until(
            EC.presence_of_element_located((By.CSS_SELECTOR, '.form-actions button'))
        )
        
        # 如果按鈕存在，發送通知到 Google Chat
        if button:
            發送通知()
            print("發現按鈕並已發送通知！")
    
    except TimeoutException:
        print("未找到按鈕")
    except Exception as e:
        print(f"發生錯誤: {str(e)}")
    finally:
        driver.quit()

def 發送通知():
    # Google Chat Webhook URL
    webhook_url = 'https://chat.googleapis.com/v1/spaces/AAAA0Wr2GQg/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=DbuYawV9tEjOSqix66w-3iPazKvIB3wMFrqs68RUQlw'
    
    # 訊息內容
    message = {
        'text': '🎉 KKTIX 按鈕已經出現！請快去查看：\nhttps://kktix.com/events/58652d0a/registrations/new'
    }
    
    # 發送 POST 請求
    response = requests.post(webhook_url, json=message)
    if response.status_code != 200:
        print(f"發送通知失敗: {response.status_code}")

def 主程式():
    print("開始監控 KKTIX 網頁...")
    # 設定每30秒執行一次檢查
    schedule.every(30).seconds.do(檢查按鈕)
    
    # 持續運行
    while True:
        schedule.run_pending()
        time.sleep(1)

if __name__ == "__main__":
    主程式()
