-- 產品 URL
SELECT 
    'product' as type,
    CONCAT('http://dev-release-m2v243.mrliving.tw/', url_path) as url
FROM (
    SELECT 
        p.entity_id,
        urk.request_path as url_path,
        ROW_NUMBER() OVER (PARTITION BY p.entity_id ORDER BY 
            CASE WHEN urk.target_path NOT LIKE '%/category/%' THEN 0 ELSE 1 END,
            LENGTH(urk.request_path)
        ) as rn
    FROM catalog_product_entity p
    LEFT JOIN catalog_product_entity_int ps 
        ON p.entity_id = ps.entity_id 
        AND ps.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'status' AND entity_type_id = 4)
        AND ps.store_id = 0
    LEFT JOIN catalog_product_entity_int visibility 
        ON p.entity_id = visibility.entity_id 
        AND visibility.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
        AND visibility.store_id = 0
    INNER JOIN url_rewrite urk 
        ON urk.entity_id = p.entity_id 
        AND urk.entity_type = 'product'
        AND urk.store_id = 1
        AND urk.redirect_type = 0
    WHERE 
        ps.value = 1
        AND visibility.value IN (2, 3, 4)  -- 包含所有可見類型
        AND p.type_id IN ('simple', 'configurable', 'grouped', 'bundle')
) as ranked_urls
WHERE rn = 1

UNION ALL

-- 分類 URL
SELECT 
    'category' as type,
    CONCAT('http://dev-release-m2v243.mrliving.tw/', urk.request_path) as url
FROM catalog_category_entity c
INNER JOIN catalog_category_entity_int ci
    ON c.entity_id = ci.entity_id
    AND ci.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'is_active' AND entity_type_id = 3)
    AND ci.store_id = 0
    AND ci.value = 1
INNER JOIN url_rewrite urk 
    ON urk.entity_id = c.entity_id 
    AND urk.entity_type = 'category'
    AND urk.store_id = 1
    AND urk.redirect_type = 0
WHERE c.level > 1  -- 排除根分類

UNION ALL

-- CMS 頁面 URL
SELECT 
    'cms' as type,
    CONCAT('http://dev-release-m2v243.mrliving.tw/', p.identifier) as url
FROM cms_page p
WHERE p.is_active = 1
    AND p.identifier NOT IN ('admin', 'no-route', 'home')  -- 排除系統頁面

UNION ALL

-- CMS Block 中包含的 URL (從 content 欄位提取)
SELECT 
    'cms_block_content' as type,
    CONCAT('http://dev-release-m2v243.mrliving.tw/', 
           TRIM(BOTH '"' FROM 
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(content, 'url=', -1), 
                    ' ', 1
                )
           )
    ) as url
FROM cms_block cb
WHERE cb.is_active = 1
    AND cb.content IS NOT NULL
    AND cb.content LIKE '%url=%'
    AND cb.content REGEXP 'url=["\']?[^"\'\\s>]+["\']?'

UNION ALL

-- CMS 頁面 content 中包含的 URL
SELECT 
    'cms_page_content' as type,
    CONCAT('http://dev-release-m2v243.mrliving.tw/', 
           TRIM(BOTH '"' FROM 
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(content, 'url=', -1), 
                    ' ', 1
                )
           )
    ) as url
FROM cms_page cp
WHERE cp.is_active = 1
    AND cp.content IS NOT NULL
    AND cp.content LIKE '%url=%'
    AND cp.content REGEXP 'url=["\']?[^"\'\\s>]+["\']?'

UNION ALL

-- CMS Block 中包含的 href URL (<a href=...>)
SELECT 
    'cms_block_href' as type,
    CASE 
        WHEN TRIM(BOTH '"' FROM TRIM(BOTH "'" FROM 
            SUBSTRING_INDEX(
                SUBSTRING_INDEX(content, 'href=', -1), 
                CASE 
                    WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE '"%' THEN '"'
                    WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE "'%" THEN "'"
                    ELSE ' '
                END, 1
            )
        )) LIKE 'http%' 
        THEN TRIM(BOTH '"' FROM TRIM(BOTH "'" FROM 
            SUBSTRING_INDEX(
                SUBSTRING_INDEX(content, 'href=', -1), 
                CASE 
                    WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE '"%' THEN '"'
                    WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE "'%" THEN "'"
                    ELSE ' '
                END, 1
            )
        ))
        ELSE CONCAT('http://dev-release-m2v243.mrliving.tw/', 
            TRIM(LEADING '/' FROM TRIM(BOTH '"' FROM TRIM(BOTH "'" FROM 
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(content, 'href=', -1), 
                    CASE 
                        WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE '"%' THEN '"'
                        WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE "'%" THEN "'"
                        ELSE ' '
                    END, 1
                )
            )))
        )
    END as url
FROM cms_block cb
WHERE cb.is_active = 1
    AND cb.content IS NOT NULL
    AND cb.content LIKE '%href=%'
    AND cb.content REGEXP 'href=["\']?[^"\'\\s>]+["\']?'

UNION ALL

-- CMS 頁面 content 中包含的 href URL (<a href=...>)
SELECT 
    'cms_page_href' as type,
    CASE 
        WHEN TRIM(BOTH '"' FROM TRIM(BOTH "'" FROM 
            SUBSTRING_INDEX(
                SUBSTRING_INDEX(content, 'href=', -1), 
                CASE 
                    WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE '"%' THEN '"'
                    WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE "'%" THEN "'"
                    ELSE ' '
                END, 1
            )
        )) LIKE 'http%' 
        THEN TRIM(BOTH '"' FROM TRIM(BOTH "'" FROM 
            SUBSTRING_INDEX(
                SUBSTRING_INDEX(content, 'href=', -1), 
                CASE 
                    WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE '"%' THEN '"'
                    WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE "'%" THEN "'"
                    ELSE ' '
                END, 1
            )
        ))
        ELSE CONCAT('http://dev-release-m2v243.mrliving.tw/', 
            TRIM(LEADING '/' FROM TRIM(BOTH '"' FROM TRIM(BOTH "'" FROM 
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(content, 'href=', -1), 
                    CASE 
                        WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE '"%' THEN '"'
                        WHEN SUBSTRING_INDEX(content, 'href=', -1) LIKE "'%" THEN "'"
                        ELSE ' '
                    END, 1
                )
            )))
        )
    END as url
FROM cms_page cp
WHERE cp.is_active = 1
    AND cp.content IS NOT NULL
    AND cp.content LIKE '%href=%'
    AND cp.content REGEXP 'href=["\']?[^"\'\\s>]+["\']?'

ORDER BY type, url;