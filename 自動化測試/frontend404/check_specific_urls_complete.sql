-- 完整版本：檢查所有可能包含HTML內容的欄位
-- 包括產品的所有text/textarea類型屬性

SELECT DISTINCT * FROM (
    -- 在 CMS 頁面中查找
    SELECT 
        'CMS Page' as found_in_type,
        p.page_id as location_id,
        p.title as location_name,
        p.identifier as location_identifier,
        CONCAT('http://dev-release-m2v243.mrliving.tw/', p.identifier) as location_url,
        'content' as field_name,
        p.content as html_content
    FROM cms_page p
    WHERE p.is_active = 1
    AND (
        p.content LIKE '%/1018090.html%'
        OR p.content LIKE '%/1018092.htm%'
        OR IFNULL(p.meta_description, '') LIKE '%/1018090.html%'
        OR IFNULL(p.meta_description, '') LIKE '%/1018092.htm%'
        OR IFNULL(p.meta_keywords, '') LIKE '%/1018090.html%'
        OR IFNULL(p.meta_keywords, '') LIKE '%/1018092.htm%'
        OR IFNULL(p.layout_update_xml, '') LIKE '%/1018090.html%'
        OR IFNULL(p.layout_update_xml, '') LIKE '%/1018092.htm%'
        OR IFNULL(p.custom_layout_update_xml, '') LIKE '%/1018090.html%'
        OR IFNULL(p.custom_layout_update_xml, '') LIKE '%/1018092.htm%'
    )

    UNION ALL

    -- 在 CMS 區塊中查找
    SELECT 
        'CMS Block' as found_in_type,
        b.block_id as location_id,
        b.title as location_name,
        b.identifier as location_identifier,
        CONCAT('Block: ', b.identifier) as location_url,
        'content' as field_name,
        b.content as html_content
    FROM cms_block b
    WHERE b.is_active = 1
    AND (
        b.content LIKE '%/1018090.html%'
        OR b.content LIKE '%/1018092.htm%'
    )

    UNION ALL

    -- 在產品的所有TEXT類型屬性中查找
    SELECT DISTINCT
        'Product Text Attribute' as found_in_type,
        p.entity_id as location_id,
        CONCAT(IFNULL(pv.value, ''), ' (', p.sku, ')') as location_name,
        CONCAT(p.sku, ' - ', ea.attribute_code) as location_identifier,
        CONCAT('http://dev-release-m2v243.mrliving.tw/', IFNULL(urk.request_path, '')) as location_url,
        ea.attribute_code as field_name,
        pt.value as html_content
    FROM catalog_product_entity p
    JOIN catalog_product_entity_text pt ON p.entity_id = pt.entity_id
    JOIN eav_attribute ea ON pt.attribute_id = ea.attribute_id
        AND ea.entity_type_id = 4  -- product entity type
        AND ea.backend_type = 'text'  -- 所有text類型的屬性
    LEFT JOIN catalog_product_entity_varchar pv ON p.entity_id = pv.entity_id 
        AND pv.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'name' AND entity_type_id = 4)
        AND pv.store_id = 0
    LEFT JOIN url_rewrite urk ON urk.entity_id = p.entity_id 
        AND urk.entity_type = 'product' 
        AND urk.store_id = 1
        AND urk.redirect_type = 0
    LEFT JOIN catalog_product_entity_int vis ON p.entity_id = vis.entity_id 
        AND vis.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
        AND vis.store_id = 0
    WHERE IFNULL(vis.value, 4) > 1  -- 排除 visibility = 1 (Not Visible Individually)
    AND (
        pt.value LIKE '%/1018090.html%'
        OR pt.value LIKE '%/1018092.htm%'
    )

    UNION ALL

    -- 在產品的所有VARCHAR類型屬性中查找（可能包含HTML的長文字欄位）
    SELECT DISTINCT
        'Product Varchar Attribute' as found_in_type,
        p.entity_id as location_id,
        CONCAT(IFNULL(pv_name.value, ''), ' (', p.sku, ')') as location_name,
        CONCAT(p.sku, ' - ', ea.attribute_code) as location_identifier,
        CONCAT('http://dev-release-m2v243.mrliving.tw/', IFNULL(urk.request_path, '')) as location_url,
        ea.attribute_code as field_name,
        pv.value as html_content
    FROM catalog_product_entity p
    JOIN catalog_product_entity_varchar pv ON p.entity_id = pv.entity_id
    JOIN eav_attribute ea ON pv.attribute_id = ea.attribute_id
        AND ea.entity_type_id = 4  -- product entity type
        AND ea.backend_type = 'varchar'  -- varchar類型的屬性
        AND ea.frontend_input IN ('textarea', 'editor')  -- 可能包含HTML的欄位類型
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
    WHERE IFNULL(vis.value, 4) > 1  -- 排除 visibility = 1 (Not Visible Individually)
    AND pv.value IS NOT NULL
    AND pv.value != ''
    AND (
        pv.value LIKE '%/1018090.html%'
        OR pv.value LIKE '%/1018092.htm%'
    )

    UNION ALL

    -- 在分類描述中查找
    SELECT DISTINCT
        'Category Description' as found_in_type,
        c.entity_id as location_id,
        IFNULL(cv.value, 'Unnamed Category') as location_name,
        CONCAT('category_', c.entity_id, ' - ', ea.attribute_code) as location_identifier,
        CONCAT('http://dev-release-m2v243.mrliving.tw/', IFNULL(urk.request_path, '')) as location_url,
        ea.attribute_code as field_name,
        ct.value as html_content
    FROM catalog_category_entity c
    JOIN catalog_category_entity_text ct ON c.entity_id = ct.entity_id
    JOIN eav_attribute ea ON ct.attribute_id = ea.attribute_id
        AND ea.entity_type_id = 3  -- category entity type
    LEFT JOIN catalog_category_entity_varchar cv ON c.entity_id = cv.entity_id
        AND cv.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'name' AND entity_type_id = 3)
        AND cv.store_id = 0
    LEFT JOIN url_rewrite urk ON urk.entity_id = c.entity_id 
        AND urk.entity_type = 'category'
        AND urk.store_id = 1
    WHERE (
        ct.value LIKE '%/1018090.html%'
        OR ct.value LIKE '%/1018092.htm%'
    )

    UNION ALL

    -- 在分類的VARCHAR類型屬性中查找
    SELECT DISTINCT
        'Category Varchar Attribute' as found_in_type,
        c.entity_id as location_id,
        IFNULL(cv_name.value, 'Unnamed Category') as location_name,
        CONCAT('category_', c.entity_id, ' - ', ea.attribute_code) as location_identifier,
        CONCAT('http://dev-release-m2v243.mrliving.tw/', IFNULL(urk.request_path, '')) as location_url,
        ea.attribute_code as field_name,
        cv.value as html_content
    FROM catalog_category_entity c
    JOIN catalog_category_entity_varchar cv ON c.entity_id = cv.entity_id
    JOIN eav_attribute ea ON cv.attribute_id = ea.attribute_id
        AND ea.entity_type_id = 3  -- category entity type
        AND ea.backend_type = 'varchar'
        AND ea.frontend_input IN ('textarea', 'editor')  -- 可能包含HTML的欄位類型
    LEFT JOIN catalog_category_entity_varchar cv_name ON c.entity_id = cv_name.entity_id
        AND cv_name.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'name' AND entity_type_id = 3)
        AND cv_name.store_id = 0
    LEFT JOIN url_rewrite urk ON urk.entity_id = c.entity_id 
        AND urk.entity_type = 'category'
        AND urk.store_id = 1
    WHERE cv.value IS NOT NULL
    AND cv.value != ''
    AND (
        cv.value LIKE '%/1018090.html%'
        OR cv.value LIKE '%/1018092.htm%'
    )

) as all_url_references
ORDER BY found_in_type, location_name, field_name;

-- 查看所有可能包含HTML的產品屬性列表
SELECT 
    ea.attribute_code,
    ea.frontend_label,
    ea.backend_type,
    ea.frontend_input,
    COUNT(*) as products_with_content
FROM eav_attribute ea
LEFT JOIN catalog_product_entity_text pt ON ea.attribute_id = pt.attribute_id
LEFT JOIN catalog_product_entity_varchar pv ON ea.attribute_id = pv.attribute_id
WHERE ea.entity_type_id = 4  -- product entity type
AND (
    (ea.backend_type = 'text') 
    OR (ea.backend_type = 'varchar' AND ea.frontend_input IN ('textarea', 'editor'))
)
GROUP BY ea.attribute_id, ea.attribute_code, ea.frontend_label, ea.backend_type, ea.frontend_input
ORDER BY ea.attribute_code; 