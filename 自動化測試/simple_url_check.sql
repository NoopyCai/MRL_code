-- 簡化版URL檢查查詢
-- 先執行這個來快速了解哪些URL在數據庫中存在

-- 1. 檢查URL重寫表 (最重要的表)
SELECT 
    'URL重寫規則' as 來源,
    request_path as 請求路徑,
    target_path as 目標路徑,
    entity_type as 實體類型,
    entity_id as 實體ID,
    store_id as 商店ID
FROM url_rewrite 
WHERE request_path LIKE '%1018019%' 
   OR request_path LIKE '%1018073%'
   OR request_path LIKE '%pluffy%'
   OR request_path LIKE '%modular-sofa%'
   OR request_path LIKE '%gl-sheets%'
   OR request_path LIKE '%homedecor%'
   OR request_path LIKE '%loungechair%'
   OR request_path LIKE '%electric-leather-sofa%'
   OR request_path LIKE '%sydney%'
ORDER BY request_path;

-- 2. 檢查產品是否存在 (通過SKU)
SELECT 
    '產品SKU' as 來源,
    sku as SKU,
    entity_id as 產品ID,
    'Product' as 實體類型
FROM catalog_product_entity 
WHERE sku IN ('1018019', '1018073', '1018088', '1018089', '1018090', '1018091', '1018092', '1018093');

-- 3. 檢查產品URL key
SELECT 
    '產品URL' as 來源,
    CONCAT('/', cpev.value, '.html') as URL路徑,
    cpe.sku as SKU,
    cpe.entity_id as 產品ID
FROM catalog_product_entity cpe
JOIN catalog_product_entity_varchar cpev ON cpe.entity_id = cpev.entity_id
JOIN eav_attribute ea ON cpev.attribute_id = ea.attribute_id
WHERE ea.attribute_code = 'url_key'
  AND (cpev.value LIKE '%pluffy%' 
       OR cpev.value LIKE '%1018%'
       OR cpev.value LIKE '%gl-sheets%'
       OR cpev.value LIKE '%homedecor%'
       OR cpev.value LIKE '%loungechair%'
       OR cpev.value LIKE '%modular-sofa%')
ORDER BY cpev.value;

-- 4. 檢查CMS頁面
SELECT 
    'CMS頁面' as 來源,
    CONCAT('/', identifier) as URL路徑,
    title as 標題,
    page_id as 頁面ID,
    is_active as 是否啟用
FROM cms_page 
WHERE identifier LIKE '%pluffy%' 
   OR identifier LIKE '%1018%'
   OR identifier LIKE '%gl-sheets%'
   OR identifier LIKE '%homedecor%'
   OR identifier LIKE '%modular%'
ORDER BY identifier;

