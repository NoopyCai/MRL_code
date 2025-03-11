from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import requests
import time

def query_train_schedule():
    driver = webdriver.Chrome()

    try:
        driver.get("https://www.railway.gov.tw/tra-tip-web/tip/tip001/tip123/query")
        wait = WebDriverWait(driver, 10)

        label_element = wait.until(EC.element_to_be_clickable((By.XPATH, "//label[@for='orderType2']")))
        label_element.click()

        pid_input = wait.until(EC.presence_of_element_located((By.NAME, "pid")))
        driver.execute_script("arguments[0].value = '';", pid_input)
        pid_input.send_keys("N226335806")

        start_station_input = driver.find_element(By.NAME, "ticketOrderParamList[0].startStation")
        driver.execute_script("arguments[0].value = '';", start_station_input)
        start_station_input.send_keys("3360-彰化")

        end_station_input = driver.find_element(By.NAME, "ticketOrderParamList[0].endStation")
        driver.execute_script("arguments[0].value = '';", end_station_input)
        end_station_input.send_keys("1100-中壢")

        ride_date_input = driver.find_element(By.NAME, "ticketOrderParamList[0].rideDate")
        driver.execute_script("arguments[0].value = '2025/04/06';", ride_date_input)

        start_time_input = driver.find_element(By.NAME, "ticketOrderParamList[0].startTime")
        driver.execute_script("arguments[0].value = '';", start_time_input)
        start_time_input.send_keys("17:00")

        end_time_input = driver.find_element(By.NAME, "ticketOrderParamList[0].endTime")
        driver.execute_script("arguments[0].value = '';", end_time_input)
        end_time_input.send_keys("19:59")

        for i in range(1, 5):
            label = wait.until(EC.element_to_be_clickable((By.XPATH, f"//label[@for='ticketOrderParamList0.trainTypeList{i}']")))
            label.click()

        submit_button = wait.until(EC.element_to_be_clickable((By.XPATH, "//input[@type='submit']")))
        submit_button.click()

        itinerary_controls = wait.until(EC.presence_of_all_elements_located((By.CLASS_NAME, "trip-column")))

        target_radio = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//label[@for='route00']"))
    )
        target_radio.click()

        time.sleep(5)

        next_button = WebDriverWait(driver, 20).until(
            EC.element_to_be_clickable((By.XPATH, "//button[@title='下一步：選擇票種']"))
        )
        next_button.click()
        time.sleep(60)
        # complete_booking_button = WebDriverWait(driver, 20).until(
        #     EC.element_to_be_clickable((By.XPATH, "//button[@title='完成訂票']"))
        # )
        # complete_booking_button.click()

        
        
        # 添加行程
        for element in itinerary_controls:
            result_text += f"{element.text}\n"

        print(result_text)
        send_line_message("U8588fb1fa69ed939416fb6235988ec35", result_text)
    finally:
        driver.quit()

def send_line_message(user_id, message):
    line_api_url = "https://api.line.me/v2/bot/message/push"
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer CCCIRx+kcuU2XmwOh8qY/GkEMQiP5IxGnIHoJgQuN8FQ233XbfyYvzsd44Lb++j5Afz56l2KObchrWb0vq753H5dmsv/ABYPxbu2CoaC4qwhbZVM4w7ywdliX3z0wKJ9CwzwKjtZ/mUo1qiuYgw7UgdB04t89/1O/w1cDnyilFU="
    }
    data = {
        "to": user_id,
        "messages": [
            {
                "type": "text",
                "text": message
            }
        ]
    }
    response = requests.post(line_api_url, headers=headers, json=data)
    if response.status_code != 200:
        print(f"Failed to send message: {response.status_code}, {response.text}")

query_train_schedule()
