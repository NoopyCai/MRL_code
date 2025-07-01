SELECT
  ur.request_path,
  p.sku,
  p.entity_id
FROM url_rewrite ur
JOIN catalog_product_entity p ON ur.entity_id = p.entity_id AND ur.entity_type = 'product'
WHERE ur.request_path LIKE '%.html'; 