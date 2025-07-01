#!/usr/bin/env python3
"""
重新生成完整的 404_in_site.sql 文件
"""

def create_complete_sql():
    """生成完整的 SQL 文件"""
    
    # 讀取 404 URLs
    with open('404_not_found_urls_urls_only.txt', 'r') as f:
        urls = []
        for line in f:
            url = line.strip()
            if url:
                # 移除開頭的 /
                if url.startswith('/'):
                    url = url[1:]
                # 轉義單引號
                url = url.replace("'", "''")
                urls.append(url)
    
    print(f"讀取到 {len(urls)} 個 URL")
    
    # 生成完整的 SQL
    sql_content = []
    sql_content.append("-- 先建立 URL/pathname 清單")
    sql_content.append("WITH url_list AS (")
    
    # 添加所有 URL
    for i, url in enumerate(urls):
        if i == 0:
            sql_content.append(f"    SELECT '{url}' AS url UNION ALL")
        elif i == len(urls) - 1:
            sql_content.append(f"    SELECT '{url}'")
        else:
            sql_content.append(f"    SELECT '{url}' UNION ALL")
    
    sql_content.append(")")
    sql_content.append("")
    
    # 添加查詢部分
    query_part = """
SELECT * FROM (
    -- CMS Page
    SELECT
        u.url as matched_url,
        'CMS Page' as found_in_type,
        p.page_id as location_id,
        p.title as location_name,
        p.identifier as location_identifier,
        'content' as field_name,
        p.content as html_content
    FROM cms_page p
    JOIN url_list u ON p.content LIKE CONCAT('%', u.url, '%')
    WHERE p.is_active = 1

    UNION ALL

    -- CMS Block
    SELECT
        u.url as matched_url,
        'CMS Block' as found_in_type,
        b.block_id as location_id,
        b.title as location_name,
        b.identifier as location_identifier,
        'content' as field_name,
        b.content as html_content
    FROM cms_block b
    JOIN url_list u ON b.content LIKE CONCAT('%', u.url, '%')
    WHERE b.is_active = 1

    UNION ALL

    -- Product Text Attribute
    SELECT
        u.url as matched_url,
        'Product Text Attribute' as found_in_type,
        p.entity_id as location_id,
        p.sku as location_name,
        NULL as location_identifier,
        ea.attribute_code as field_name,
        pt.value as html_content
    FROM catalog_product_entity p
    JOIN catalog_product_entity_text pt ON p.entity_id = pt.entity_id
    JOIN eav_attribute ea ON pt.attribute_id = ea.attribute_id
    JOIN url_list u ON pt.value LIKE CONCAT('%', u.url, '%')

    UNION ALL

    -- Product Varchar Attribute
    SELECT
        u.url as matched_url,
        'Product Varchar Attribute' as found_in_type,
        p.entity_id as location_id,
        p.sku as location_name,
        NULL as location_identifier,
        ea.attribute_code as field_name,
        pv.value as html_content
    FROM catalog_product_entity p
    JOIN catalog_product_entity_varchar pv ON p.entity_id = pv.entity_id
    JOIN eav_attribute ea ON pv.attribute_id = ea.attribute_id
    JOIN url_list u ON pv.value LIKE CONCAT('%', u.url, '%')

    UNION ALL

    -- Category Description
    SELECT
        u.url as matched_url,
        'Category Description' as found_in_type,
        c.entity_id as location_id,
        cv.value as location_name,
        NULL as location_identifier,
        ea.attribute_code as field_name,
        ct.value as html_content
    FROM catalog_category_entity c
    JOIN catalog_category_entity_text ct ON c.entity_id = ct.entity_id
    JOIN eav_attribute ea ON ct.attribute_id = ea.attribute_id
    LEFT JOIN catalog_category_entity_varchar cv ON c.entity_id = cv.entity_id
        AND cv.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'name' AND entity_type_id = 3)
    JOIN url_list u ON ct.value LIKE CONCAT('%', u.url, '%')
) as all_url_references;"""

    sql_content.append(query_part.strip())
    
    # 寫入文件
    with open('404_in_site.sql', 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_content))
    
    print(f"已生成新的 SQL 文件，共 {len(sql_content)} 行")

if __name__ == "__main__":
    create_complete_sql() 