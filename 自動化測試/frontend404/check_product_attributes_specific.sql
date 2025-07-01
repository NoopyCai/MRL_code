 -- 專門檢查產品屬性中是否包含 /1018090.html 或 /1018092.htm
-- 這個查詢會檢查所有text類型的產品屬性

SELECT 
    p.entity_id as product_id,
    p.sku,
    IFNULL(pv_name.value, 'Unnamed Product') as product_name,
    ea.attribute_code,
    ea.frontend_label,
    pt.value as attribute_content,
    CASE 
        WHEN pt.value LIKE '%/1018090.html%' AND pt.value LIKE '%/1018092.htm%' THEN 'Both URLs found'
        WHEN pt.value LIKE '%/1018090.html%' THEN '/1018090.html found'
        WHEN pt.value LIKE '%/1018092.htm%' THEN '/1018092.htm found'
        ELSE 'No match'
    END as url_match_status,
    CONCAT('http://dev-release-m2v243.mrliving.tw/', IFNULL(urk.request_path, '')) as product_url
FROM catalog_product_entity p
JOIN catalog_product_entity_text pt ON p.entity_id = pt.entity_id
JOIN eav_attribute ea ON pt.attribute_id = ea.attribute_id
    AND ea.entity_type_id = 4  -- product entity type
    AND ea.backend_type = 'text'  -- text類型的屬性
LEFT JOIN catalog_product_entity_varchar pv_name ON p.entity_id = pv_name.entity_id 
    AND pv_name.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'name' AND entity_type_id = 4)
    AND pv_name.store_id = 0
LEFT JOIN url_rewrite urk ON urk.entity_id = p.entity_id 
    AND urk.entity_type = 'product' 
    AND urk.store_id = 1
    AND urk.redirect_type = 0
LEFT JOIN catalog_product_entity_int vis ON p.entity_id = vis.entity_id 
    AND vis.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
    AND vis.store_id = 0
WHERE IFNULL(vis.value, 4) > 1  -- 排除不可見產品
AND pt.value IS NOT NULL
AND pt.value != ''
AND (
    pt.value LIKE '%/1018090.html%'
    OR pt.value LIKE '%/1018092.htm%'
)
ORDER BY p.sku, ea.attribute_code;

-- 統計每個屬性中找到URL的數量
SELECT 
    ea.attribute_code,
    ea.frontend_label,
    COUNT(*) as total_matches,
    SUM(CASE WHEN pt.value LIKE '%/1018090.html%' THEN 1 ELSE 0 END) as matches_1018090,
    SUM(CASE WHEN pt.value LIKE '%/1018092.htm%' THEN 1 ELSE 0 END) as matches_1018092
FROM catalog_product_entity p
JOIN catalog_product_entity_text pt ON p.entity_id = pt.entity_id
JOIN eav_attribute ea ON pt.attribute_id = ea.attribute_id
    AND ea.entity_type_id = 4
    AND ea.backend_type = 'text'
LEFT JOIN catalog_product_entity_int vis ON p.entity_id = vis.entity_id 
    AND vis.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
    AND vis.store_id = 0
WHERE IFNULL(vis.value, 4) > 1
AND pt.value IS NOT NULL
AND pt.value != ''
AND (
    pt.value LIKE '%/1018090.html%'
    OR pt.value LIKE '%/1018092.htm%'
)
GROUP BY ea.attribute_id, ea.attribute_code, ea.frontend_label
ORDER BY total_matches DESC;

-- 檢查特定屬性（根據您的需求可以調整）
-- 例如只檢查description, custom_layout_update, depth等主要屬性
SELECT 
    p.entity_id as product_id,
    p.sku,
    IFNULL(pv_name.value, 'Unnamed Product') as product_name,
    ea.attribute_code,
    SUBSTRING(pt.value, 1, 200) as content_preview,  -- 只顯示前200字符
    CASE 
        WHEN pt.value LIKE '%/1018090.html%' AND pt.value LIKE '%/1018092.htm%' THEN 'Both URLs found'
        WHEN pt.value LIKE '%/1018090.html%' THEN '/1018090.html found'
        WHEN pt.value LIKE '%/1018092.htm%' THEN '/1018092.htm found'
        ELSE 'No match'
    END as url_match_status
FROM catalog_product_entity p
JOIN catalog_product_entity_text pt ON p.entity_id = pt.entity_id
JOIN eav_attribute ea ON pt.attribute_id = ea.attribute_id
    AND ea.entity_type_id = 4
    AND ea.attribute_code IN ('description', 'custom_layout_update', 'depth', 'diameter')  -- 指定要檢查的屬性
LEFT JOIN catalog_product_entity_varchar pv_name ON p.entity_id = pv_name.entity_id 
    AND pv_name.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'name' AND entity_type_id = 4)
    AND pv_name.store_id = 0
LEFT JOIN catalog_product_entity_int vis ON p.entity_id = vis.entity_id 
    AND vis.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
    AND vis.store_id = 0
WHERE IFNULL(vis.value, 4) > 1
AND pt.value IS NOT NULL
AND pt.value != ''
AND (
    pt.value LIKE '%/1018090.html%'
    OR pt.value LIKE '%/1018092.htm%'
)
ORDER BY p.sku, ea.attribute_code;