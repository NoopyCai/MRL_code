-- 先建立 URL/pathname 清單
WITH url_list AS (
    SELECT 'discount/dis-bryant/pluffy-chaise-1018585.html' AS url UNION ALL
    SELECT 'discount/dis-bryant/pluffy-ottoman-1018606.html' UNION ALL
    SELECT 'discount/dis-bryant/pluffy-chaise-1018592.html' UNION ALL
    SELECT 'discount/dis-bryant/pluffy-ottoman-1018613.html' UNION ALL
    SELECT 'discount/modular-sofa-pluffy-5451.html' UNION ALL
    SELECT 'discount/modular-sofa-pluffy-5454.html' UNION ALL
    SELECT 'discount/modular-sofa-pluffy-5457.html' UNION ALL
    SELECT 'discount/modular-sofa-pluffy-5460.html' UNION ALL
    SELECT 'discount/modular-sofa-pluffy-5463.html' UNION ALL
    SELECT 'discount/modular-sofa-pluffy-5466.html' UNION ALL
    SELECT 'discount/modular-sofa-pluffy-5469.html' UNION ALL
    SELECT 'discount/pluffy-arm-1018564.html' UNION ALL
    SELECT 'discount/pluffy-arm-1018557.html' UNION ALL
    SELECT 'discount/pluffy-arm-1018571.html' UNION ALL
    SELECT 'discount/pluffy-arm-1018578.html' UNION ALL
    SELECT 'discount/pluffy-chaise-1018585.html' UNION ALL
    SELECT 'discount/pluffy-armless-1018599.html' UNION ALL
    SELECT 'discount/pluffy-chaise-1018592.html' UNION ALL
    SELECT 'discount/pluffy-ottoman-1018606.html' UNION ALL
    SELECT 'discount/pluffy-ottoman-1018613.html' UNION ALL
    SELECT 'electric-leather-sofa-1018278.html' UNION ALL
    SELECT 'electric-leather-sofa-1018279.html' UNION ALL
    SELECT 'electric-leather-sofa-1018281.html' UNION ALL
    SELECT 'electric-leather-sofa-1018282.html' UNION ALL
    SELECT 'electric-leather-sofa-1018284.html' UNION ALL
    SELECT 'electric-leather-sofa-1018285.html' UNION ALL
    SELECT 'electric-leather-sofa-1018287.html' UNION ALL
    SELECT 'electric-leather-sofa-1018288.html' UNION ALL
    SELECT 'gl-sheets-b-single.html' UNION ALL
    SELECT 'gl-sheets-dg-queen.html' UNION ALL
    SELECT 'gl-sheets-dg-single.html' UNION ALL
    SELECT 'gl-sheets-g-queen.html' UNION ALL
    SELECT 'gl-sheets-g-single.html' UNION ALL
    SELECT 'gl-sheets-p-single.html' UNION ALL
    SELECT 'gl-sheets-w-single.html' UNION ALL
    SELECT 'gl-sheets-p-queen.html' UNION ALL
    SELECT 'gl-sheets-w-queen.html' UNION ALL
    SELECT 'hermes.html' UNION ALL
    SELECT 'homedecor-1018102.html' UNION ALL
    SELECT 'homedecor-1018115.html' UNION ALL
    SELECT 'homedecor-1018111.html' UNION ALL
    SELECT 'homedecor-1018130.html' UNION ALL
    SELECT 'homedecor-1018128.html' UNION ALL
    SELECT 'homedecor-1018127.html' UNION ALL
    SELECT 'homedecor-1018134.html' UNION ALL
    SELECT 'homedecor-1018136.html' UNION ALL
    SELECT 'homedecor-1018144.html' UNION ALL
    SELECT 'homedecor-1018145.html' UNION ALL
    SELECT 'homedecor-1018152.html' UNION ALL
    SELECT 'homedecor-1018156.html' UNION ALL
    SELECT 'homedecor-1018157.html' UNION ALL
    SELECT 'homedecor-1018153.html' UNION ALL
    SELECT 'homedecor-1018158.html' UNION ALL
    SELECT 'homedecor-1018159.html' UNION ALL
    SELECT 'homedecor-1018160.html' UNION ALL
    SELECT 'homedecor-1018167.html' UNION ALL
    SELECT 'homedecor-1018172.html' UNION ALL
    SELECT 'homedecor-1018166.html' UNION ALL
    SELECT 'homedecor-1018170.html' UNION ALL
    SELECT 'homedecor-1018173.html' UNION ALL
    SELECT 'homedecor-1018174.html' UNION ALL
    SELECT 'homedecor-1018179.html' UNION ALL
    SELECT 'homedecor-1018175.html' UNION ALL
    SELECT 'homedecor-1018181.html' UNION ALL
    SELECT 'homedecor-1018184.html' UNION ALL
    SELECT 'homedecor-1018183.html' UNION ALL
    SELECT 'homedecor-1018182.html' UNION ALL
    SELECT 'homedecor-1018185.html' UNION ALL
    SELECT 'homedecor-1018189.html' UNION ALL
    SELECT 'homedecor-1018191.html' UNION ALL
    SELECT 'homedecor-1018190.html' UNION ALL
    SELECT 'homedecor-1018194.html' UNION ALL
    SELECT 'homedecor-1018196.html' UNION ALL
    SELECT 'homedecor-1018198.html' UNION ALL
    SELECT 'homedecor-1018206.html' UNION ALL
    SELECT 'homedecor-1018208.html' UNION ALL
    SELECT 'homedecor-1018209.html' UNION ALL
    SELECT 'loungechair-1018223.html' UNION ALL
    SELECT 'loungechair-1018224.html' UNION ALL
    SELECT 'loungechair-1018225.html' UNION ALL
    SELECT 'loungechair-1018227.html' UNION ALL
    SELECT 'loungechair-1018226.html' UNION ALL
    SELECT 'loungechair-1018228.html' UNION ALL
    SELECT 'modular-sofa-dune-5707.html' UNION ALL
    SELECT 'modular-sofa-dune-5708.html' UNION ALL
    SELECT 'modular-sofa-pluffy-5451.html' UNION ALL
    SELECT 'modular-sofa-pluffy-5454.html' UNION ALL
    SELECT 'modular-sofa-pluffy-5457.html' UNION ALL
    SELECT 'modular-sofa-pluffy-5460.html' UNION ALL
    SELECT 'modular-sofa-pluffy-5463.html' UNION ALL
    SELECT 'modular-sofa-pluffy-5466.html' UNION ALL
    SELECT 'modular-sofa-pluffy-5469.html' UNION ALL
    SELECT 'pluffy-arm-1018557.html' UNION ALL
    SELECT 'pluffy-arm-1018564.html' UNION ALL
    SELECT 'pluffy-arm-1018571.html' UNION ALL
    SELECT 'pluffy-arm-1018578.html' UNION ALL
    SELECT 'pluffy-armless-1018599.html' UNION ALL
    SELECT 'pluffy-chaise-1018585.html' UNION ALL
    SELECT 'pluffy-chaise-1018592.html' UNION ALL
    SELECT 'pluffy-ottoman-1018606.html' UNION ALL
    SELECT 'pluffy-ottoman-1018613.html' UNION ALL
    SELECT 'sofas-nordic-rufus-rhf-light-grey.html' UNION ALL
    SELECT 'sofas/pluffy-arm-1018557.html' UNION ALL
    SELECT 'sofas/pluffy-arm-1018564.html' UNION ALL
    SELECT 'sofas/pluffy-arm-1018571.html' UNION ALL
    SELECT 'sofas/size/modular-seating/pluffy-arm-1018557.html' UNION ALL
    SELECT 'sofas/size/modular-seating/pluffy-arm-1018564.html' UNION ALL
    SELECT 'sofas/size/modular-seating/pluffy-arm-1018571.html' UNION ALL
    SELECT 'sofas/size/modular-seating/pluffy-arm-1018578.html' UNION ALL
    SELECT 'sofas/size/modular-seating/pluffy-armless-1018599.html' UNION ALL
    SELECT 'sofas/size/modular-seating/pluffy-chaise-1018585.html' UNION ALL
    SELECT 'sofas/size/modular-seating/pluffy-chaise-1018592.html' UNION ALL
    SELECT 'sofas/size/pluffy-arm-1018557.html' UNION ALL
    SELECT 'sofas/size/pluffy-arm-1018564.html' UNION ALL
    SELECT 'sofas/size/pluffy-arm-1018571.html' UNION ALL
    SELECT 'sofas/size/pluffy-arm-1018578.html' UNION ALL
    SELECT 'sofas/size/pluffy-armless-1018599.html' UNION ALL
    SELECT 'sofas/size/pluffy-chaise-1018585.html' UNION ALL
    SELECT 'sofas/size/pluffy-chaise-1018592.html' UNION ALL
    SELECT 'sydney-140-ceramic-diningtable.html' UNION ALL
    SELECT 'sydney-159-ceramic-diningtable.html' UNION ALL
    SELECT 'sydney-159-tanceramic-diningtable.html' UNION ALL
    SELECT 'sydney-140-tanceramic-diningtable.html' UNION ALL
    SELECT 'sydney-180-ceramic-diningtable.html' UNION ALL
    SELECT 'bruce-3sofa-petfriendly-tan.html' UNION ALL
    SELECT '1018091.html'
)

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
) as all_url_references;