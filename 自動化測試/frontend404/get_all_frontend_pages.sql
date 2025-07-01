SELECT 
    'Product' as page_type,
    CONCAT('/', cpev_url.value, '.html') as page_url,
    cpev_name.value as page_title,
    cpe.sku as sku,
    cpe.entity_id,
    'catalog/product/view/id/' || cpe.entity_id as backend_path,
    cpevi_status.value as status,
    cpevi_visibility.value as visibility
FROM catalog_product_entity cpe
-- 產品名稱
LEFT JOIN catalog_product_entity_varchar cpev_name 
    ON cpe.entity_id = cpev_name.entity_id 
    AND cpev_name.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'name' AND entity_type_id = 4)
    AND cpev_name.store_id = 0
-- 產品URL key
LEFT JOIN catalog_product_entity_varchar cpev_url 
    ON cpe.entity_id = cpev_url.entity_id 
    AND cpev_url.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'url_key' AND entity_type_id = 4)
    AND cpev_url.store_id = 0
-- 產品狀態
LEFT JOIN catalog_product_entity_int cpevi_status
    ON cpe.entity_id = cpevi_status.entity_id 
    AND cpevi_status.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'status' AND entity_type_id = 4)
    AND cpevi_status.store_id = 0
-- 產品可見性
LEFT JOIN catalog_product_entity_int cpevi_visibility
    ON cpe.entity_id = cpevi_visibility.entity_id 
    AND cpevi_visibility.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
    AND cpevi_visibility.store_id = 0
WHERE cpevi_status.value = 1  -- 啟用
    AND cpevi_visibility.value IN (2, 3, 4)  -- 可見 (2=catalog, 3=search, 4=catalog&search)
    AND cpev_url.value IS NOT NULL
    AND cpev_url.value != ''

UNION ALL

-- 2. URL重寫規則中的所有前台可訪問URL
SELECT 
    'URL Rewrite' as page_type,
    CONCAT('/', request_path) as page_url,
    entity_type || ' Rewrite' as page_title,
    NULL as sku,
    entity_id,
    target_path as backend_path,
    NULL as status,
    1 as visibility
FROM url_rewrite 
WHERE request_path IS NOT NULL
    AND request_path != ''
    AND store_id IN (0, 1)  -- 主要商店
    AND redirect_type = 0  -- 不是重定向

ORDER BY page_type, page_url;