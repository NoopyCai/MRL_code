-- 查詢產品基本資訊
SELECT entity_id, sku, type_id 
FROM catalog_product_entity 
WHERE sku = 'pluffy-arm-1018557';

-- 查詢 CMS 頁面中的產品引用
SELECT * FROM cms_page 
WHERE content LIKE '%pluffy-arm-1018557%';

-- 查詢 CMS 區塊中的引用
SELECT * FROM cms_block 
WHERE content LIKE '%pluffy-arm-1018557%';

-- 查詢 Widget 中的引用
SELECT * FROM widget_instance 
WHERE instance_type LIKE '%product%';
