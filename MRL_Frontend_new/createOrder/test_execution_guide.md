# TemporaryStorage 單元測試執行指南

## 概述

這份文件說明如何執行 `temporaryStorage.html` 的完整單元測試，確保所有功能都能正常運作。

## 測試文件結構

```
MRL_code/MRL_Frontend_new/createOrder/
├── temporaryStorage.html                    # 原始功能文件
├── temporaryStorage_unit_tests.html         # 基礎單元測試
├── temporaryStorage_integration_tests.html  # 整合測試（如果需要）
└── test_execution_guide.md                 # 本指南
```

## 測試覆蓋範圍

### 1. 核心模組測試

#### StorageHelper 模組
- ✅ 資料儲存和讀取功能
- ✅ 空值處理
- ✅ 資料刪除功能
- ✅ 過期資料清理功能
- ✅ 錯誤處理

#### FormFieldHelper 模組
- ✅ 表單欄位初始化
- ✅ 不同類型欄位值取得（text, radio, checkbox, fieldset）
- ✅ 特殊欄位處理（order-billing_address_city_id）
- ✅ 全部欄位資料收集
- ✅ 欄位資料設定

#### UserDataHelper 模組
- ✅ Email 格式驗證
- ✅ 用戶資料儲存
- ✅ 用戶資料載入
- ✅ 用戶資料刪除
- ✅ Email 鍵值更新

#### DialogHelper 模組
- ✅ 彈窗內容建立
- ✅ 確認對話框建立
- ✅ 基本對話框建立
- ✅ 空資料處理

#### NotificationHelper 模組
- ✅ 成功訊息顯示
- ✅ 預設訊息處理

### 2. 整合測試

#### 完整用戶流程
- ✅ 用戶資料儲存完整流程
- ✅ Email 變更處理流程
- ✅ 產品項目儲存流程
- ✅ 產品資料儲存流程

#### 多用戶場景
- ✅ 多個用戶資料處理
- ✅ 用戶刪除操作

### 3. 性能測試

- ✅ 大量用戶資料處理性能（100 個用戶 < 1秒）
- ✅ 大量用戶資料載入性能（50 個用戶 < 100ms）
- ✅ 大量產品項目處理性能（100 個項目 < 500ms）

### 4. 邊界測試

- ✅ 空字串和 null 值處理
- ✅ 極長字串處理
- ✅ 特殊字符處理
- ✅ 重複 email 處理
- ✅ localStorage 容量限制處理
- ✅ 損壞 JSON 資料處理

## 執行測試

### 方法 1: 瀏覽器執行

1. 在瀏覽器中打開 `temporaryStorage_unit_tests.html`
2. 點擊「執行所有測試」按鈕
3. 查看測試結果

### 方法 2: 命令行執行（如果使用 Node.js）

```bash
# 如果有 Node.js 環境，可以使用 puppeteer 或類似工具
npm install puppeteer
node run-tests.js
```

## 測試結果解讀

### 成功指標
- ✅ 所有測試通過率應該 > 95%
- ✅ 性能測試都在預期時間內完成
- ✅ 邊界測試都正確處理異常情況

### 失敗處理
如果有測試失敗：
1. 查看具體錯誤訊息
2. 檢查相關模組的實現
3. 驗證是否為測試環境問題
4. 必要時修正代碼

## 手動測試檢查清單

除了自動化測試，還需要手動驗證以下功能：

### UI 互動測試
- [ ] 功能選單正常開關
- [ ] 儲存按鈕顯示成功訊息
- [ ] 載入按鈕顯示用戶列表
- [ ] 清空按鈕確認對話框

### 表單互動測試
- [ ] Email 欄位變更觸發儲存
- [ ] 其他欄位變更觸發儲存
- [ ] 特殊欄位正確對應

### 對話框測試
- [ ] 用戶資料列表正確顯示
- [ ] 選擇用戶正確載入資料
- [ ] 刪除按鈕正確移除資料
- [ ] Email 變更確認對話框

### 產品功能測試
- [ ] 產品項目選取儲存
- [ ] 產品資料（交期、備註）儲存
- [ ] 購物車商品還原

## 性能基準

| 功能 | 預期性能 | 實際測試 |
|------|----------|----------|
| 儲存 100 個用戶 | < 1000ms | ✅ |
| 載入 50 個用戶 | < 100ms | ✅ |
| 儲存 100 個產品項目 | < 500ms | ✅ |

## 錯誤處理驗證

### localStorage 相關
- [ ] 容量超限處理
- [ ] 權限拒絕處理
- [ ] 損壞資料恢復

### 網絡相關
- [ ] 離線狀態處理
- [ ] 網絡中斷恢復

### 資料驗證
- [ ] 無效 Email 格式拒絕
- [ ] 空值資料過濾
- [ ] 過期資料清理

## 測試環境要求

### 瀏覽器支援
- Chrome 70+
- Firefox 65+
- Safari 12+
- Edge 79+

### 功能要求
- localStorage 支援
- ES5+ JavaScript 支援
- DOM API 支援

## 持續整合

建議將測試整合到 CI/CD 流程中：

```yaml
# .github/workflows/test.yml 範例
name: Frontend Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run Tests
        run: |
          npm install puppeteer
          node run-browser-tests.js
```

## 測試維護

### 定期檢查
- 每月執行完整測試套件
- 新功能開發時增加對應測試
- 定期更新性能基準

### 測試更新
- 功能變更時同步更新測試
- 新增邊界情況測試
- 優化測試執行效率

## 故障排除

### 常見問題

#### 測試環境問題
```javascript
// 如果 localStorage 不可用
if (typeof Storage === "undefined") {
    console.error("此瀏覽器不支援 localStorage");
}
```

#### DOM 元素缺失
```javascript
// 確保測試 DOM 元素存在
if (!document.getElementById('email')) {
    console.error("測試環境缺少必要的 DOM 元素");
}
```

#### 時間相關測試
```javascript
// 性能測試可能因環境而異
// 適當調整時間閾值
const PERFORMANCE_THRESHOLD = isSlowEnvironment ? 2000 : 1000;
```

## 結論

這套測試框架確保了 `temporaryStorage.html` 的所有功能都能正常運作：

1. **完整覆蓋**: 涵蓋所有核心模組和功能
2. **多層測試**: 單元測試 + 整合測試 + 性能測試 + 邊界測試
3. **自動化**: 可自動執行並生成報告
4. **可維護**: 易於擴展和維護

定期執行這些測試可以確保代碼品質和功能穩定性。 