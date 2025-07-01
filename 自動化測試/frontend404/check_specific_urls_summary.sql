-- 檢查 CMS 頁面、CMS 區塊、產品描述中是否包含 /1018090.html 或 /1018092.htm
-- 簡化版本：只顯示摘要信息，不返回完整HTML內容

SELECT DISTINCT 
    found_in_type,
    location_id,
    location_name,
    location_identifier,
    location_url,
    field_name,
    CASE 
        WHEN html_content LIKE '%/1018090.html%' AND html_content LIKE '%/1018092.htm%' THEN 'Both URLs found'
        WHEN html_content LIKE '%/1018090.html%' THEN '/1018090.html found'
        WHEN html_content LIKE '%/1018092.htm%' THEN '/1018092.htm found'
        ELSE 'No target URLs found'
    END as url_match_status
FROM (
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

    -- 在產品描述中查找 (description 和 short_description)
    SELECT DISTINCT
        'Product Description' as found_in_type,
        p.entity_id as location_id,
        CONCAT(IFNULL(pv.value, ''), ' (', p.sku, ')') as location_name,
        p.sku as location_identifier,
        CONCAT('http://dev-release-m2v243.mrliving.tw/', IFNULL(urk.request_path, '')) as location_url,
        CASE 
            WHEN ea.attribute_code = 'description' THEN 'description'
            WHEN ea.attribute_code = 'short_description' THEN 'short_description'
            ELSE 'other'
        END as field_name,
        pt.value as html_content
    FROM catalog_product_entity p
    JOIN catalog_product_entity_text pt ON p.entity_id = pt.entity_id
    JOIN eav_attribute ea ON pt.attribute_id = ea.attribute_id
        AND ea.attribute_code IN ('description', 'short_description') 
        AND ea.entity_type_id = 4
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

    -- 在分類描述中查找
    SELECT DISTINCT
        'Category Description' as found_in_type,
        c.entity_id as location_id,
        IFNULL(cv.value, 'Unnamed Category') as location_name,
        CONCAT('category_', c.entity_id) as location_identifier,
        CONCAT('http://dev-release-m2v243.mrliving.tw/', IFNULL(urk.request_path, '')) as location_url,
        CASE 
            WHEN ea.attribute_code = 'description' THEN 'description'
            WHEN ea.attribute_code = 'meta_description' THEN 'meta_description'
            WHEN ea.attribute_code = 'meta_keywords' THEN 'meta_keywords'
            ELSE 'other'
        END as field_name,
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

) as url_references
ORDER BY found_in_type, location_name;

-- 統計摘要
SELECT 
    found_in_type,
    COUNT(*) as total_references,
    SUM(CASE WHEN url_match_status LIKE '%/1018090.html%' THEN 1 ELSE 0 END) as references_to_1018090,
    SUM(CASE WHEN url_match_status LIKE '%/1018092.htm%' THEN 1 ELSE 0 END) as references_to_1018092
FROM (
    -- 重複上面的查詢邏輯但簡化為統計用途
    SELECT 
        'CMS Page' as found_in_type,
        CASE 
            WHEN p.content LIKE '%/1018090.html%' AND p.content LIKE '%/1018092.htm%' THEN 'Both URLs found'
            WHEN p.content LIKE '%/1018090.html%' THEN '/1018090.html found'
            WHEN p.content LIKE '%/1018092.htm%' THEN '/1018092.htm found'
            ELSE 'No target URLs found'
        END as url_match_status
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

    SELECT 
        'CMS Block' as found_in_type,
        CASE 
            WHEN b.content LIKE '%/1018090.html%' AND b.content LIKE '%/1018092.htm%' THEN 'Both URLs found'
            WHEN b.content LIKE '%/1018090.html%' THEN '/1018090.html found'
            WHEN b.content LIKE '%/1018092.htm%' THEN '/1018092.htm found'
            ELSE 'No target URLs found'
        END as url_match_status
    FROM cms_block b
    WHERE b.is_active = 1
    AND (
        b.content LIKE '%/1018090.html%'
        OR b.content LIKE '%/1018092.htm%'
    )

    UNION ALL

    SELECT DISTINCT
        'Product Description' as found_in_type,
        CASE 
            WHEN pt.value LIKE '%/1018090.html%' AND pt.value LIKE '%/1018092.htm%' THEN 'Both URLs found'
            WHEN pt.value LIKE '%/1018090.html%' THEN '/1018090.html found'
            WHEN pt.value LIKE '%/1018092.htm%' THEN '/1018092.htm found'
            ELSE 'No target URLs found'
        END as url_match_status
    FROM catalog_product_entity p
    JOIN catalog_product_entity_text pt ON p.entity_id = pt.entity_id
    JOIN eav_attribute ea ON pt.attribute_id = ea.attribute_id
        AND ea.attribute_code IN ('description', 'short_description') 
        AND ea.entity_type_id = 4
    LEFT JOIN catalog_product_entity_int vis ON p.entity_id = vis.entity_id 
        AND vis.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
        AND vis.store_id = 0
    WHERE IFNULL(vis.value, 4) > 1
    AND (
        pt.value LIKE '%/1018090.html%'
        OR pt.value LIKE '%/1018092.htm%'
    )

    UNION ALL

    SELECT DISTINCT
        'Category Description' as found_in_type,
        CASE 
            WHEN ct.value LIKE '%/1018090.html%' AND ct.value LIKE '%/1018092.htm%' THEN 'Both URLs found'
            WHEN ct.value LIKE '%/1018090.html%' THEN '/1018090.html found'
            WHEN ct.value LIKE '%/1018092.htm%' THEN '/1018092.htm found'
            ELSE 'No target URLs found'
        END as url_match_status
    FROM catalog_category_entity c
    JOIN catalog_category_entity_text ct ON c.entity_id = ct.entity_id
    JOIN eav_attribute ea ON ct.attribute_id = ea.attribute_id
        AND ea.entity_type_id = 3
    WHERE (
        ct.value LIKE '%/1018090.html%'
        OR ct.value LIKE '%/1018092.htm%'
    )
) as summary_data
GROUP BY found_in_type
ORDER BY found_in_type; 