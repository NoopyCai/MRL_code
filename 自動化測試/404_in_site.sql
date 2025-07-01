-- 批量查詢多個產品的頁面位置
SELECT 
    cpe.sku as product_sku,
    cpev_main.value as product_url_key,
    'Product Page' as page_type, 
    CONCAT('/', cpev_main.value, '.html') as page_url, 
    cpe.sku as reference
FROM catalog_product_entity cpe
LEFT JOIN catalog_product_entity_varchar cpev_main 
    ON cpe.entity_id = cpev_main.entity_id 
    AND cpev_main.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'url_key' AND entity_type_id = 4)
    AND cpev_main.store_id = 0
LEFT JOIN catalog_product_entity_int cpei
    ON cpe.entity_id = cpei.entity_id 
    AND cpei.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'status' AND entity_type_id = 4)
    AND cpei.store_id = 0
LEFT JOIN catalog_product_entity_int cpevi
    ON cpe.entity_id = cpevi.entity_id 
    AND cpevi.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
    AND cpevi.store_id = 0
WHERE cpei.value = 1 
    AND cpevi.value != 1
    AND (cpe.sku IN (
        '1018090', '1018092', '1018073', '1018093', '1018089', '1018088', '1018019', '1018091',
        'modular-sofa-pluffy-5451', 'modular-sofa-pluffy-5457', 'modular-sofa-pluffy-5454',
        'modular-sofa-pluffy-5463', 'modular-sofa-pluffy-5460', 'modular-sofa-pluffy-5466',
        'modular-sofa-pluffy-5469', 'pluffy-arm-1018557', 'pluffy-arm-1018564', 'pluffy-arm-1018571',
        'pluffy-arm-1018578', 'pluffy-armless-1018599', 'pluffy-chaise-1018585', 'pluffy-ottoman-1018606',
        'pluffy-chaise-1018592', 'pluffy-ottoman-1018613'
    ) OR cpev_main.value IN (
        '1018090', '1018092', '1018073', '1018093', '1018089', '1018088', '1018019', '1018091',
        'modular-sofa-pluffy-5451', 'modular-sofa-pluffy-5457', 'modular-sofa-pluffy-5454',
        'modular-sofa-pluffy-5463', 'modular-sofa-pluffy-5460', 'modular-sofa-pluffy-5466',
        'modular-sofa-pluffy-5469', 'pluffy-arm-1018557', 'pluffy-arm-1018564', 'pluffy-arm-1018571',
        'pluffy-arm-1018578', 'pluffy-armless-1018599', 'pluffy-chaise-1018585', 'pluffy-ottoman-1018606',
        'pluffy-chaise-1018592', 'pluffy-ottoman-1018613', 'electric-leather-sofa-1018278',
        'electric-leather-sofa-1018279', 'electric-leather-sofa-1018281', 'electric-leather-sofa-1018282',
        'electric-leather-sofa-1018284', 'electric-leather-sofa-1018285', 'electric-leather-sofa-1018287',
        'electric-leather-sofa-1018288', 'gl-sheets-b-single', 'gl-sheets-dg-queen', 'gl-sheets-dg-single',
        'gl-sheets-g-queen', 'gl-sheets-g-single', 'gl-sheets-p-single', 'gl-sheets-w-single',
        'gl-sheets-p-queen', 'gl-sheets-w-queen', 'hermes', 'homedecor-1018102', 'homedecor-1018115',
        'homedecor-1018111', 'homedecor-1018130', 'homedecor-1018128', 'homedecor-1018127',
        'homedecor-1018134', 'homedecor-1018136', 'homedecor-1018144', 'homedecor-1018145',
        'homedecor-1018152', 'homedecor-1018156', 'homedecor-1018157', 'homedecor-1018153',
        'homedecor-1018158', 'homedecor-1018159', 'homedecor-1018160', 'homedecor-1018167',
        'homedecor-1018172', 'homedecor-1018166', 'homedecor-1018170', 'homedecor-1018173',
        'homedecor-1018174', 'homedecor-1018179', 'homedecor-1018175', 'homedecor-1018181',
        'homedecor-1018184', 'homedecor-1018183', 'homedecor-1018182', 'homedecor-1018185',
        'homedecor-1018189', 'homedecor-1018191', 'homedecor-1018190', 'homedecor-1018194',
        'homedecor-1018196', 'homedecor-1018198', 'homedecor-1018206', 'homedecor-1018208',
        'homedecor-1018209', 'loungechair-1018223', 'loungechair-1018224', 'loungechair-1018225',
        'loungechair-1018227', 'loungechair-1018226', 'loungechair-1018228', 'modular-sofa-dune-5707',
        'modular-sofa-dune-5708', 'sofas-nordic-rufus-rhf-light-grey', 'sydney-140-ceramic-diningtable',
        'sydney-159-ceramic-diningtable', 'sydney-159-tanceramic-diningtable', 'sydney-140-tanceramic-diningtable',
        'sydney-180-ceramic-diningtable'
    ))

UNION ALL

-- 分類頁面查詢
SELECT 
    cpe.sku as product_sku,
    cpev.value as product_url_key,
    'Category Page' as page_type,
    CONCAT('/', ccu.value, '.html') as page_url,
    ccv.value as reference
FROM catalog_product_entity cpe
JOIN catalog_category_product ccp ON cpe.entity_id = ccp.product_id
LEFT JOIN catalog_product_entity_varchar cpev 
    ON cpe.entity_id = cpev.entity_id 
    AND cpev.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'url_key' AND entity_type_id = 4)
    AND cpev.store_id = 0
LEFT JOIN catalog_category_entity_varchar ccv 
    ON ccp.category_id = ccv.entity_id 
    AND ccv.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'name' AND entity_type_id = 3)
    AND ccv.store_id = 0
LEFT JOIN catalog_category_entity_varchar ccu 
    ON ccp.category_id = ccu.entity_id 
    AND ccu.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'url_path' AND entity_type_id = 3)
    AND ccu.store_id = 0
LEFT JOIN catalog_category_entity_int cci
    ON ccp.category_id = cci.entity_id 
    AND cci.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'is_active' AND entity_type_id = 3)
    AND cci.store_id = 0
LEFT JOIN catalog_product_entity_int cpevi
    ON cpe.entity_id = cpevi.entity_id 
    AND cpevi.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE attribute_code = 'visibility' AND entity_type_id = 4)
    AND cpevi.store_id = 0
WHERE cci.value = 1 
    AND (cpevi.value = 2 OR cpevi.value = 4)
    AND (cpe.sku IN (
        '1018090', '1018092', '1018073', '1018093', '1018089', '1018088', '1018019', '1018091',
        'modular-sofa-pluffy-5451', 'modular-sofa-pluffy-5457', 'modular-sofa-pluffy-5454',
        'modular-sofa-pluffy-5463', 'modular-sofa-pluffy-5460', 'modular-sofa-pluffy-5466',
        'modular-sofa-pluffy-5469', 'pluffy-arm-1018557', 'pluffy-arm-1018564', 'pluffy-arm-1018571',
        'pluffy-arm-1018578', 'pluffy-armless-1018599', 'pluffy-chaise-1018585', 'pluffy-ottoman-1018606',
        'pluffy-chaise-1018592', 'pluffy-ottoman-1018613'
    ) OR cpev.value IN (
        '1018090', '1018092', '1018073', '1018093', '1018089', '1018088', '1018019', '1018091',
        'modular-sofa-pluffy-5451', 'modular-sofa-pluffy-5457', 'modular-sofa-pluffy-5454',
        'modular-sofa-pluffy-5463', 'modular-sofa-pluffy-5460', 'modular-sofa-pluffy-5466',
        'modular-sofa-pluffy-5469', 'pluffy-arm-1018557', 'pluffy-arm-1018564', 'pluffy-arm-1018571',
        'pluffy-arm-1018578', 'pluffy-armless-1018599', 'pluffy-chaise-1018585', 'pluffy-ottoman-1018606',
        'pluffy-chaise-1018592', 'pluffy-ottoman-1018613', 'electric-leather-sofa-1018278',
        'electric-leather-sofa-1018279', 'electric-leather-sofa-1018281', 'electric-leather-sofa-1018282',
        'electric-leather-sofa-1018284', 'electric-leather-sofa-1018285', 'electric-leather-sofa-1018287',
        'electric-leather-sofa-1018288', 'gl-sheets-b-single', 'gl-sheets-dg-queen', 'gl-sheets-dg-single',
        'gl-sheets-g-queen', 'gl-sheets-g-single', 'gl-sheets-p-single', 'gl-sheets-w-single',
        'gl-sheets-p-queen', 'gl-sheets-w-queen', 'hermes', 'homedecor-1018102', 'homedecor-1018115',
        'homedecor-1018111', 'homedecor-1018130', 'homedecor-1018128', 'homedecor-1018127',
        'homedecor-1018134', 'homedecor-1018136', 'homedecor-1018144', 'homedecor-1018145',
        'homedecor-1018152', 'homedecor-1018156', 'homedecor-1018157', 'homedecor-1018153',
        'homedecor-1018158', 'homedecor-1018159', 'homedecor-1018160', 'homedecor-1018167',
        'homedecor-1018172', 'homedecor-1018166', 'homedecor-1018170', 'homedecor-1018173',
        'homedecor-1018174', 'homedecor-1018179', 'homedecor-1018175', 'homedecor-1018181',
        'homedecor-1018184', 'homedecor-1018183', 'homedecor-1018182', 'homedecor-1018185',
        'homedecor-1018189', 'homedecor-1018191', 'homedecor-1018190', 'homedecor-1018194',
        'homedecor-1018196', 'homedecor-1018198', 'homedecor-1018206', 'homedecor-1018208',
        'homedecor-1018209', 'loungechair-1018223', 'loungechair-1018224', 'loungechair-1018225',
        'loungechair-1018227', 'loungechair-1018226', 'loungechair-1018228', 'modular-sofa-dune-5707',
        'modular-sofa-dune-5708', 'sofas-nordic-rufus-rhf-light-grey', 'sydney-140-ceramic-diningtable',
        'sydney-159-ceramic-diningtable', 'sydney-159-tanceramic-diningtable', 'sydney-140-tanceramic-diningtable',
        'sydney-180-ceramic-diningtable'
    ))

ORDER BY product_sku, page_type, page_url;