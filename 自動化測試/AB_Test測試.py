from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
import time
import json
from collections import Counter

class ABTestAutomation:
    def __init__(self):
        self.product_url = "http://dev-release-m2v243.mrliving.tw/modular-sofa-pluffy-5425.html"
        self.cart_url = "http://dev-release-m2v243.mrliving.tw/checkout/cart/"
        self.results = Counter()

    def run_test(self, iterations=20):
        for i in range(iterations):
            # 設定 Chrome 為無頭模式
            chrome_options = Options()
            chrome_options.add_argument('--headless')
            chrome_options.add_argument('--disable-gpu')
            chrome_options.add_argument('--no-sandbox')
            chrome_options.add_argument('--window-size=1920,1080')
            driver = webdriver.Chrome(options=chrome_options)
            try:
                driver.get(self.product_url)
                time.sleep(3)
                driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
                time.sleep(2)
                add_to_cart_button = WebDriverWait(driver, 10).until(
                    EC.presence_of_element_located((By.ID, "product-addtocart-button"))
                )
                driver.execute_script("arguments[0].click();", add_to_cart_button)
                time.sleep(3)
                driver.get(self.cart_url)
                time.sleep(2)
                nantu_tests = driver.execute_script("return localStorage.getItem('nantu_tests')")
                print(f"Test {i+1}: nantu_tests 原始內容: {nantu_tests}")
                if nantu_tests:
                    try:
                        test_value = json.loads(nantu_tests)
                    except Exception as e:
                        test_value = nantu_tests  # 直接用字串
                    if test_value == ["1:c"] or test_value == "1:c" or test_value == '[1:c]':
                        self.results["High_sales"] += 1
                        print(f"Test {i+1}: High_sales 目前次數: {self.results['High_sales']}")
                    elif test_value == ["1:v1"] or test_value == "1:v1" or test_value == '[1:v1]':
                        self.results["High_traffic"] += 1
                        print(f"Test {i+1}: High_traffic 目前次數: {self.results['High_traffic']}")
                    else:
                        self.results["Unknown"] += 1
                        print(f"Test {i+1}: Unknown 目前次數: {self.results['Unknown']}")
                else:
                    print(f"Test {i+1}: 沒有取得到 nantu_tests")
                print(f"Test {i+1} completed. Current results: {dict(self.results)}")
            except Exception as e:
                print(f"Error in iteration {i+1}: {str(e)}")
            finally:
                driver.quit()
        self.print_final_results()

    def print_final_results(self):
        total = sum(self.results.values())
        print("\nFinal Results:")
        print("=" * 50)
        for version, count in self.results.items():
            percentage = (count / total) * 100 if total > 0 else 0
            print(f"{version}: {count} times ({percentage:.2f}%)")
        print("=" * 50)

if __name__ == "__main__":
    test = ABTestAutomation()
    test.run_test(iterations=1000) 
