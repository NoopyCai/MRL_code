-- 查詢 CMS 頁面中包含指定 URL 的內容
SELECT 
    'CMS Page' AS location_type,
    page_id,
    title,
    identifier AS page_url,
    CASE 
        WHEN content LIKE '%pluffy-chaise-1018585.html%' THEN 'pluffy-chaise-1018585.html'
        WHEN content LIKE '%pluffy-ottoman-1018606.html%' THEN 'pluffy-ottoman-1018606.html'
        WHEN content LIKE '%pluffy-chaise-1018592.html%' THEN 'pluffy-chaise-1018592.html'
        WHEN content LIKE '%pluffy-ottoman-1018613.html%' THEN 'pluffy-ottoman-1018613.html'
        WHEN content LIKE '%modular-sofa-pluffy-5451.html%' THEN 'modular-sofa-pluffy-5451.html'
        WHEN content LIKE '%modular-sofa-pluffy-5454.html%' THEN 'modular-sofa-pluffy-5454.html'
        WHEN content LIKE '%modular-sofa-pluffy-5457.html%' THEN 'modular-sofa-pluffy-5457.html'
        WHEN content LIKE '%modular-sofa-pluffy-5460.html%' THEN 'modular-sofa-pluffy-5460.html'
        WHEN content LIKE '%modular-sofa-pluffy-5463.html%' THEN 'modular-sofa-pluffy-5463.html'
        WHEN content LIKE '%modular-sofa-pluffy-5466.html%' THEN 'modular-sofa-pluffy-5466.html'
        WHEN content LIKE '%modular-sofa-pluffy-5469.html%' THEN 'modular-sofa-pluffy-5469.html'
        WHEN content LIKE '%pluffy-arm-1018564.html%' THEN 'pluffy-arm-1018564.html'
        WHEN content LIKE '%pluffy-arm-1018557.html%' THEN 'pluffy-arm-1018557.html'
        WHEN content LIKE '%pluffy-arm-1018571.html%' THEN 'pluffy-arm-1018571.html'
        WHEN content LIKE '%pluffy-arm-1018578.html%' THEN 'pluffy-arm-1018578.html'
        WHEN content LIKE '%pluffy-armless-1018599.html%' THEN 'pluffy-armless-1018599.html'
        WHEN content LIKE '%electric-leather-sofa-1018278.html%' THEN 'electric-leather-sofa-1018278.html'
        WHEN content LIKE '%electric-leather-sofa-1018279.html%' THEN 'electric-leather-sofa-1018279.html'
        WHEN content LIKE '%electric-leather-sofa-1018281.html%' THEN 'electric-leather-sofa-1018281.html'
        WHEN content LIKE '%electric-leather-sofa-1018282.html%' THEN 'electric-leather-sofa-1018282.html'
        WHEN content LIKE '%electric-leather-sofa-1018284.html%' THEN 'electric-leather-sofa-1018284.html'
        WHEN content LIKE '%electric-leather-sofa-1018285.html%' THEN 'electric-leather-sofa-1018285.html'
        WHEN content LIKE '%electric-leather-sofa-1018287.html%' THEN 'electric-leather-sofa-1018287.html'
        WHEN content LIKE '%electric-leather-sofa-1018288.html%' THEN 'electric-leather-sofa-1018288.html'
        WHEN content LIKE '%gl-sheets-b-single.html%' THEN 'gl-sheets-b-single.html'
        WHEN content LIKE '%gl-sheets-dg-queen.html%' THEN 'gl-sheets-dg-queen.html'
        WHEN content LIKE '%gl-sheets-dg-single.html%' THEN 'gl-sheets-dg-single.html'
        WHEN content LIKE '%gl-sheets-g-queen.html%' THEN 'gl-sheets-g-queen.html'
        WHEN content LIKE '%gl-sheets-g-single.html%' THEN 'gl-sheets-g-single.html'
        WHEN content LIKE '%gl-sheets-p-single.html%' THEN 'gl-sheets-p-single.html'
        WHEN content LIKE '%gl-sheets-w-single.html%' THEN 'gl-sheets-w-single.html'
        WHEN content LIKE '%gl-sheets-p-queen.html%' THEN 'gl-sheets-p-queen.html'
        WHEN content LIKE '%gl-sheets-w-queen.html%' THEN 'gl-sheets-w-queen.html'
        WHEN content LIKE '%hermes.html%' THEN 'hermes.html'
        WHEN content LIKE '%homedecor-1018102.html%' THEN 'homedecor-1018102.html'
        WHEN content LIKE '%homedecor-1018115.html%' THEN 'homedecor-1018115.html'
        WHEN content LIKE '%homedecor-1018111.html%' THEN 'homedecor-1018111.html'
        WHEN content LIKE '%homedecor-1018130.html%' THEN 'homedecor-1018130.html'
        WHEN content LIKE '%homedecor-1018128.html%' THEN 'homedecor-1018128.html'
        WHEN content LIKE '%homedecor-1018127.html%' THEN 'homedecor-1018127.html'
        WHEN content LIKE '%homedecor-1018134.html%' THEN 'homedecor-1018134.html'
        WHEN content LIKE '%homedecor-1018136.html%' THEN 'homedecor-1018136.html'
        WHEN content LIKE '%homedecor-1018144.html%' THEN 'homedecor-1018144.html'
        WHEN content LIKE '%homedecor-1018145.html%' THEN 'homedecor-1018145.html'
        WHEN content LIKE '%homedecor-1018152.html%' THEN 'homedecor-1018152.html'
        WHEN content LIKE '%homedecor-1018156.html%' THEN 'homedecor-1018156.html'
        WHEN content LIKE '%homedecor-1018157.html%' THEN 'homedecor-1018157.html'
        WHEN content LIKE '%homedecor-1018153.html%' THEN 'homedecor-1018153.html'
        WHEN content LIKE '%homedecor-1018158.html%' THEN 'homedecor-1018158.html'
        WHEN content LIKE '%homedecor-1018159.html%' THEN 'homedecor-1018159.html'
        WHEN content LIKE '%homedecor-1018160.html%' THEN 'homedecor-1018160.html'
        WHEN content LIKE '%homedecor-1018167.html%' THEN 'homedecor-1018167.html'
        WHEN content LIKE '%homedecor-1018172.html%' THEN 'homedecor-1018172.html'
        WHEN content LIKE '%homedecor-1018166.html%' THEN 'homedecor-1018166.html'
        WHEN content LIKE '%homedecor-1018170.html%' THEN 'homedecor-1018170.html'
        WHEN content LIKE '%homedecor-1018173.html%' THEN 'homedecor-1018173.html'
        WHEN content LIKE '%homedecor-1018174.html%' THEN 'homedecor-1018174.html'
        WHEN content LIKE '%homedecor-1018179.html%' THEN 'homedecor-1018179.html'
        WHEN content LIKE '%homedecor-1018175.html%' THEN 'homedecor-1018175.html'
        WHEN content LIKE '%homedecor-1018181.html%' THEN 'homedecor-1018181.html'
        WHEN content LIKE '%homedecor-1018184.html%' THEN 'homedecor-1018184.html'
        WHEN content LIKE '%homedecor-1018183.html%' THEN 'homedecor-1018183.html'
        WHEN content LIKE '%homedecor-1018182.html%' THEN 'homedecor-1018182.html'
        WHEN content LIKE '%homedecor-1018185.html%' THEN 'homedecor-1018185.html'
        WHEN content LIKE '%homedecor-1018189.html%' THEN 'homedecor-1018189.html'
        WHEN content LIKE '%homedecor-1018191.html%' THEN 'homedecor-1018191.html'
        WHEN content LIKE '%homedecor-1018190.html%' THEN 'homedecor-1018190.html'
        WHEN content LIKE '%homedecor-1018194.html%' THEN 'homedecor-1018194.html'
        WHEN content LIKE '%homedecor-1018196.html%' THEN 'homedecor-1018196.html'
        WHEN content LIKE '%homedecor-1018198.html%' THEN 'homedecor-1018198.html'
        WHEN content LIKE '%homedecor-1018206.html%' THEN 'homedecor-1018206.html'
        WHEN content LIKE '%homedecor-1018208.html%' THEN 'homedecor-1018208.html'
        WHEN content LIKE '%homedecor-1018209.html%' THEN 'homedecor-1018209.html'
        WHEN content LIKE '%loungechair-1018223.html%' THEN 'loungechair-1018223.html'
        WHEN content LIKE '%loungechair-1018224.html%' THEN 'loungechair-1018224.html'
        WHEN content LIKE '%loungechair-1018225.html%' THEN 'loungechair-1018225.html'
        WHEN content LIKE '%loungechair-1018227.html%' THEN 'loungechair-1018227.html'
        WHEN content LIKE '%loungechair-1018226.html%' THEN 'loungechair-1018226.html'
        WHEN content LIKE '%loungechair-1018228.html%' THEN 'loungechair-1018228.html'
        WHEN content LIKE '%modular-sofa-dune-5707.html%' THEN 'modular-sofa-dune-5707.html'
        WHEN content LIKE '%modular-sofa-dune-5708.html%' THEN 'modular-sofa-dune-5708.html'
        WHEN content LIKE '%sofas-nordic-rufus-rhf-light-grey.html%' THEN 'sofas-nordic-rufus-rhf-light-grey.html'
        WHEN content LIKE '%sofas/pluffy-arm-1018557.html%' THEN 'sofas/pluffy-arm-1018557.html'
        WHEN content LIKE '%sofas/pluffy-arm-1018564.html%' THEN 'sofas/pluffy-arm-1018564.html'
        WHEN content LIKE '%sofas/pluffy-arm-1018571.html%' THEN 'sofas/pluffy-arm-1018571.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018557.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018564.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018571.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018578.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%' THEN 'sofas/size/modular-seating/pluffy-armless-1018599.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%' THEN 'sofas/size/modular-seating/pluffy-chaise-1018585.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%' THEN 'sofas/size/modular-seating/pluffy-chaise-1018592.html'
        WHEN content LIKE '%sofas/size/pluffy-arm-1018557.html%' THEN 'sofas/size/pluffy-arm-1018557.html'
        WHEN content LIKE '%sofas/size/pluffy-arm-1018564.html%' THEN 'sofas/size/pluffy-arm-1018564.html'
        WHEN content LIKE '%sofas/size/pluffy-arm-1018571.html%' THEN 'sofas/size/pluffy-arm-1018571.html'
        WHEN content LIKE '%sofas/size/pluffy-arm-1018578.html%' THEN 'sofas/size/pluffy-arm-1018578.html'
        WHEN content LIKE '%sofas/size/pluffy-armless-1018599.html%' THEN 'sofas/size/pluffy-armless-1018599.html'
        WHEN content LIKE '%sofas/size/pluffy-chaise-1018585.html%' THEN 'sofas/size/pluffy-chaise-1018585.html'
        WHEN content LIKE '%sofas/size/pluffy-chaise-1018592.html%' THEN 'sofas/size/pluffy-chaise-1018592.html'
        WHEN content LIKE '%sydney-140-ceramic-diningtable.html%' THEN 'sydney-140-ceramic-diningtable.html'
        WHEN content LIKE '%sydney-159-ceramic-diningtable.html%' THEN 'sydney-159-ceramic-diningtable.html'
        WHEN content LIKE '%sydney-159-tanceramic-diningtable.html%' THEN 'sydney-159-tanceramic-diningtable.html'
        WHEN content LIKE '%sydney-140-tanceramic-diningtable.html%' THEN 'sydney-140-tanceramic-diningtable.html'
        WHEN content LIKE '%sydney-180-ceramic-diningtable.html%' THEN 'sydney-180-ceramic-diningtable.html'
        ELSE 'unknown'
    END AS matched_url,
    -- 提取上下文
    CASE 
        WHEN content LIKE '%pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-chaise-1018585.html', content) - 50), 
                LENGTH('pluffy-chaise-1018585.html') + 100)
        WHEN content LIKE '%pluffy-ottoman-1018606.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-ottoman-1018606.html', content) - 50), 
                LENGTH('pluffy-ottoman-1018606.html') + 100)
        WHEN content LIKE '%pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-chaise-1018592.html', content) - 50), 
                LENGTH('pluffy-chaise-1018592.html') + 100)
        WHEN content LIKE '%pluffy-ottoman-1018613.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-ottoman-1018613.html', content) - 50), 
                LENGTH('pluffy-ottoman-1018613.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5451.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5451.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5451.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5454.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5454.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5454.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5457.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5457.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5457.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5460.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5460.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5460.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5463.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5463.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5463.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5466.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5466.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5466.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5469.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5469.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5469.html') + 100)
        WHEN content LIKE '%pluffy-arm-1018564.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-arm-1018564.html', content) - 50), 
                LENGTH('pluffy-arm-1018564.html') + 100)
        WHEN content LIKE '%pluffy-arm-1018557.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-arm-1018557.html', content) - 50), 
                LENGTH('pluffy-arm-1018557.html') + 100)
        WHEN content LIKE '%pluffy-arm-1018571.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-arm-1018571.html', content) - 50), 
                LENGTH('pluffy-arm-1018571.html') + 100)
        WHEN content LIKE '%pluffy-arm-1018578.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-arm-1018578.html', content) - 50), 
                LENGTH('pluffy-arm-1018578.html') + 100)
        WHEN content LIKE '%pluffy-armless-1018599.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-armless-1018599.html', content) - 50), 
                LENGTH('pluffy-armless-1018599.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018278.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018278.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018278.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018279.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018279.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018279.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018281.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018281.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018281.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018282.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018282.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018282.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018284.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018284.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018284.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018285.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018285.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018285.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018287.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018287.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018287.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018288.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018288.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018288.html') + 100)
        WHEN content LIKE '%gl-sheets-b-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-b-single.html', content) - 50), 
                LENGTH('gl-sheets-b-single.html') + 100)
        WHEN content LIKE '%gl-sheets-dg-queen.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-dg-queen.html', content) - 50), 
                LENGTH('gl-sheets-dg-queen.html') + 100)
        WHEN content LIKE '%gl-sheets-dg-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-dg-single.html', content) - 50), 
                LENGTH('gl-sheets-dg-single.html') + 100)
        WHEN content LIKE '%gl-sheets-g-queen.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-g-queen.html', content) - 50), 
                LENGTH('gl-sheets-g-queen.html') + 100)
        WHEN content LIKE '%gl-sheets-g-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-g-single.html', content) - 50), 
                LENGTH('gl-sheets-g-single.html') + 100)
        WHEN content LIKE '%gl-sheets-p-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-p-single.html', content) - 50), 
                LENGTH('gl-sheets-p-single.html') + 100)
        WHEN content LIKE '%gl-sheets-w-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-w-single.html', content) - 50), 
                LENGTH('gl-sheets-w-single.html') + 100)
        WHEN content LIKE '%gl-sheets-p-queen.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-p-queen.html', content) - 50), 
                LENGTH('gl-sheets-p-queen.html') + 100)
        WHEN content LIKE '%gl-sheets-w-queen.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-w-queen.html', content) - 50), 
                LENGTH('gl-sheets-w-queen.html') + 100)
        WHEN content LIKE '%hermes.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('hermes.html', content) - 50), 
                LENGTH('hermes.html') + 100)
        WHEN content LIKE '%homedecor-1018102.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018102.html', content) - 50), 
                LENGTH('homedecor-1018102.html') + 100)
        WHEN content LIKE '%homedecor-1018115.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018115.html', content) - 50), 
                LENGTH('homedecor-1018115.html') + 100)
        WHEN content LIKE '%homedecor-1018111.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018111.html', content) - 50), 
                LENGTH('homedecor-1018111.html') + 100)
        WHEN content LIKE '%homedecor-1018130.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018130.html', content) - 50), 
                LENGTH('homedecor-1018130.html') + 100)
        WHEN content LIKE '%homedecor-1018128.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018128.html', content) - 50), 
                LENGTH('homedecor-1018128.html') + 100)
        WHEN content LIKE '%homedecor-1018127.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018127.html', content) - 50), 
                LENGTH('homedecor-1018127.html') + 100)
        WHEN content LIKE '%homedecor-1018134.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018134.html', content) - 50), 
                LENGTH('homedecor-1018134.html') + 100)
        WHEN content LIKE '%homedecor-1018136.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018136.html', content) - 50), 
                LENGTH('homedecor-1018136.html') + 100)
        WHEN content LIKE '%homedecor-1018144.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018144.html', content) - 50), 
                LENGTH('homedecor-1018144.html') + 100)
        WHEN content LIKE '%homedecor-1018145.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018145.html', content) - 50), 
                LENGTH('homedecor-1018145.html') + 100)
        WHEN content LIKE '%homedecor-1018152.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018152.html', content) - 50), 
                LENGTH('homedecor-1018152.html') + 100)
        WHEN content LIKE '%homedecor-1018156.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018156.html', content) - 50), 
                LENGTH('homedecor-1018156.html') + 100)
        WHEN content LIKE '%homedecor-1018157.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018157.html', content) - 50), 
                LENGTH('homedecor-1018157.html') + 100)
        WHEN content LIKE '%homedecor-1018153.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018153.html', content) - 50), 
                LENGTH('homedecor-1018153.html') + 100)
        WHEN content LIKE '%homedecor-1018158.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018158.html', content) - 50), 
                LENGTH('homedecor-1018158.html') + 100)
        WHEN content LIKE '%homedecor-1018159.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018159.html', content) - 50), 
                LENGTH('homedecor-1018159.html') + 100)
        WHEN content LIKE '%homedecor-1018160.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018160.html', content) - 50), 
                LENGTH('homedecor-1018160.html') + 100)
        WHEN content LIKE '%homedecor-1018167.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018167.html', content) - 50), 
                LENGTH('homedecor-1018167.html') + 100)
        WHEN content LIKE '%homedecor-1018172.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018172.html', content) - 50), 
                LENGTH('homedecor-1018172.html') + 100)
        WHEN content LIKE '%homedecor-1018166.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018166.html', content) - 50), 
                LENGTH('homedecor-1018166.html') + 100)
        WHEN content LIKE '%homedecor-1018170.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018170.html', content) - 50), 
                LENGTH('homedecor-1018170.html') + 100)
        WHEN content LIKE '%homedecor-1018173.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018173.html', content) - 50), 
                LENGTH('homedecor-1018173.html') + 100)
        WHEN content LIKE '%homedecor-1018174.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018174.html', content) - 50), 
                LENGTH('homedecor-1018174.html') + 100)
        WHEN content LIKE '%homedecor-1018179.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018179.html', content) - 50), 
                LENGTH('homedecor-1018179.html') + 100)
        WHEN content LIKE '%homedecor-1018175.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018175.html', content) - 50), 
                LENGTH('homedecor-1018175.html') + 100)
        WHEN content LIKE '%homedecor-1018181.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018181.html', content) - 50), 
                LENGTH('homedecor-1018181.html') + 100)
        WHEN content LIKE '%homedecor-1018184.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018184.html', content) - 50), 
                LENGTH('homedecor-1018184.html') + 100)
        WHEN content LIKE '%homedecor-1018183.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018183.html', content) - 50), 
                LENGTH('homedecor-1018183.html') + 100)
        WHEN content LIKE '%homedecor-1018182.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018182.html', content) - 50), 
                LENGTH('homedecor-1018182.html') + 100)
        WHEN content LIKE '%homedecor-1018185.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018185.html', content) - 50), 
                LENGTH('homedecor-1018185.html') + 100)
        WHEN content LIKE '%homedecor-1018189.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018189.html', content) - 50), 
                LENGTH('homedecor-1018189.html') + 100)
        WHEN content LIKE '%homedecor-1018191.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018191.html', content) - 50), 
                LENGTH('homedecor-1018191.html') + 100)
        WHEN content LIKE '%homedecor-1018190.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018190.html', content) - 50), 
                LENGTH('homedecor-1018190.html') + 100)
        WHEN content LIKE '%homedecor-1018194.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018194.html', content) - 50), 
                LENGTH('homedecor-1018194.html') + 100)
        WHEN content LIKE '%homedecor-1018196.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018196.html', content) - 50), 
                LENGTH('homedecor-1018196.html') + 100)
        WHEN content LIKE '%homedecor-1018198.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018198.html', content) - 50), 
                LENGTH('homedecor-1018198.html') + 100)
        WHEN content LIKE '%homedecor-1018206.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018206.html', content) - 50), 
                LENGTH('homedecor-1018206.html') + 100)
        WHEN content LIKE '%homedecor-1018208.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018208.html', content) - 50), 
                LENGTH('homedecor-1018208.html') + 100)
        WHEN content LIKE '%homedecor-1018209.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018209.html', content) - 50), 
                LENGTH('homedecor-1018209.html') + 100)
        WHEN content LIKE '%loungechair-1018223.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018223.html', content) - 50), 
                LENGTH('loungechair-1018223.html') + 100)
        WHEN content LIKE '%loungechair-1018224.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018224.html', content) - 50), 
                LENGTH('loungechair-1018224.html') + 100)
        WHEN content LIKE '%loungechair-1018225.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018225.html', content) - 50), 
                LENGTH('loungechair-1018225.html') + 100)
        WHEN content LIKE '%loungechair-1018227.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018227.html', content) - 50), 
                LENGTH('loungechair-1018227.html') + 100)
        WHEN content LIKE '%loungechair-1018226.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018226.html', content) - 50), 
                LENGTH('loungechair-1018226.html') + 100)
        WHEN content LIKE '%loungechair-1018228.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018228.html', content) - 50), 
                LENGTH('loungechair-1018228.html') + 100)
        WHEN content LIKE '%modular-sofa-dune-5707.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-dune-5707.html', content) - 50), 
                LENGTH('modular-sofa-dune-5707.html') + 100)
        WHEN content LIKE '%modular-sofa-dune-5708.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-dune-5708.html', content) - 50), 
                LENGTH('modular-sofa-dune-5708.html') + 100)
        WHEN content LIKE '%sofas-nordic-rufus-rhf-light-grey.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas-nordic-rufus-rhf-light-grey.html', content) - 50), 
                LENGTH('sofas-nordic-rufus-rhf-light-grey.html') + 100)
        WHEN content LIKE '%sofas/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018557.html', content) - 50), 
                LENGTH('sofas/pluffy-arm-1018557.html') + 100)
        WHEN content LIKE '%sofas/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018564.html', content) - 50), 
                LENGTH('sofas/pluffy-arm-1018564.html') + 100)
        WHEN content LIKE '%sofas/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018571.html', content) - 50), 
                LENGTH('sofas/pluffy-arm-1018571.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018557.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018557.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018564.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018564.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018571.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018571.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018578.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018578.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-armless-1018599.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-armless-1018599.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-chaise-1018585.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-chaise-1018585.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-chaise-1018592.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-chaise-1018592.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018557.html', content) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018557.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018564.html', content) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018564.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018571.html', content) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018571.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-arm-1018578.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018578.html', content) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018578.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-armless-1018599.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-armless-1018599.html', content) - 50), 
                LENGTH('sofas/size/pluffy-armless-1018599.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-chaise-1018585.html', content) - 50), 
                LENGTH('sofas/size/pluffy-chaise-1018585.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-chaise-1018592.html', content) - 50), 
                LENGTH('sofas/size/pluffy-chaise-1018592.html') + 100)
        WHEN content LIKE '%sydney-140-ceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-140-ceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-140-ceramic-diningtable.html') + 100)
        WHEN content LIKE '%sydney-159-ceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-159-ceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-159-ceramic-diningtable.html') + 100)
        WHEN content LIKE '%sydney-159-tanceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-159-tanceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-159-tanceramic-diningtable.html') + 100)
        WHEN content LIKE '%sydney-140-tanceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-140-tanceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-140-tanceramic-diningtable.html') + 100)
        WHEN content LIKE '%sydney-180-ceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-180-ceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-180-ceramic-diningtable.html') + 100)
        ELSE SUBSTRING(content, 1, 200) -- 如果沒有匹配特定的 URL 模式，則提取前 200 個字符
    END AS url_context
FROM 
    cms_page
WHERE 
    content LIKE '%pluffy-chaise-1018585.html%'
    OR content LIKE '%pluffy-ottoman-1018606.html%'
    OR content LIKE '%pluffy-chaise-1018592.html%'
    OR content LIKE '%pluffy-ottoman-1018613.html%'
    OR content LIKE '%modular-sofa-pluffy-5451.html%'
    OR content LIKE '%modular-sofa-pluffy-5454.html%'
    OR content LIKE '%modular-sofa-pluffy-5457.html%'
    OR content LIKE '%modular-sofa-pluffy-5460.html%'
    OR content LIKE '%modular-sofa-pluffy-5463.html%'
    OR content LIKE '%modular-sofa-pluffy-5466.html%'
    OR content LIKE '%modular-sofa-pluffy-5469.html%'
    OR content LIKE '%pluffy-arm-1018564.html%'
    OR content LIKE '%pluffy-arm-1018557.html%'
    OR content LIKE '%pluffy-arm-1018571.html%'
    OR content LIKE '%pluffy-arm-1018578.html%'
    OR content LIKE '%pluffy-armless-1018599.html%'
    OR content LIKE '%electric-leather-sofa-1018278.html%'
    OR content LIKE '%electric-leather-sofa-1018279.html%'
    OR content LIKE '%electric-leather-sofa-1018281.html%'
    OR content LIKE '%electric-leather-sofa-1018282.html%'
    OR content LIKE '%electric-leather-sofa-1018284.html%'
    OR content LIKE '%electric-leather-sofa-1018285.html%'
    OR content LIKE '%electric-leather-sofa-1018287.html%'
    OR content LIKE '%electric-leather-sofa-1018288.html%'
    OR content LIKE '%gl-sheets-b-single.html%'
    OR content LIKE '%gl-sheets-dg-queen.html%'
    OR content LIKE '%gl-sheets-dg-single.html%'
    OR content LIKE '%gl-sheets-g-queen.html%'
    OR content LIKE '%gl-sheets-g-single.html%'
    OR content LIKE '%gl-sheets-p-single.html%'
    OR content LIKE '%gl-sheets-w-single.html%'
    OR content LIKE '%gl-sheets-p-queen.html%'
    OR content LIKE '%gl-sheets-w-queen.html%'
    OR content LIKE '%hermes.html%'
    OR content LIKE '%homedecor-1018102.html%'
    OR content LIKE '%homedecor-1018115.html%'
    OR content LIKE '%homedecor-1018111.html%'
    OR content LIKE '%homedecor-1018130.html%'
    OR content LIKE '%homedecor-1018128.html%'
    OR content LIKE '%homedecor-1018127.html%'
    OR content LIKE '%homedecor-1018134.html%'
    OR content LIKE '%homedecor-1018136.html%'
    OR content LIKE '%homedecor-1018144.html%'
    OR content LIKE '%homedecor-1018145.html%'
    OR content LIKE '%homedecor-1018152.html%'
    OR content LIKE '%homedecor-1018156.html%'
    OR content LIKE '%homedecor-1018157.html%'
    OR content LIKE '%homedecor-1018153.html%'
    OR content LIKE '%homedecor-1018158.html%'
    OR content LIKE '%homedecor-1018159.html%'
    OR content LIKE '%homedecor-1018160.html%'
    OR content LIKE '%homedecor-1018167.html%'
    OR content LIKE '%homedecor-1018172.html%'
    OR content LIKE '%homedecor-1018166.html%'
    OR content LIKE '%homedecor-1018170.html%'
    OR content LIKE '%homedecor-1018173.html%'
    OR content LIKE '%homedecor-1018174.html%'
    OR content LIKE '%homedecor-1018179.html%'
    OR content LIKE '%homedecor-1018175.html%'
    OR content LIKE '%homedecor-1018181.html%'
    OR content LIKE '%homedecor-1018184.html%'
    OR content LIKE '%homedecor-1018183.html%'
    OR content LIKE '%homedecor-1018182.html%'
    OR content LIKE '%homedecor-1018185.html%'
    OR content LIKE '%homedecor-1018189.html%'
    OR content LIKE '%homedecor-1018191.html%'
    OR content LIKE '%homedecor-1018190.html%'
    OR content LIKE '%homedecor-1018194.html%'
    OR content LIKE '%homedecor-1018196.html%'
    OR content LIKE '%homedecor-1018198.html%'
    OR content LIKE '%homedecor-1018206.html%'
    OR content LIKE '%homedecor-1018208.html%'
    OR content LIKE '%homedecor-1018209.html%'
    OR content LIKE '%loungechair-1018223.html%'
    OR content LIKE '%loungechair-1018224.html%'
    OR content LIKE '%loungechair-1018225.html%'
    OR content LIKE '%loungechair-1018227.html%'
    OR content LIKE '%loungechair-1018226.html%'
    OR content LIKE '%loungechair-1018228.html%'
    OR content LIKE '%modular-sofa-dune-5707.html%'
    OR content LIKE '%modular-sofa-dune-5708.html%'
    OR content LIKE '%sofas-nordic-rufus-rhf-light-grey.html%'
    OR content LIKE '%sofas/pluffy-arm-1018557.html%'
    OR content LIKE '%sofas/pluffy-arm-1018564.html%'
    OR content LIKE '%sofas/pluffy-arm-1018571.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%'
    OR content LIKE '%sofas/size/pluffy-arm-1018557.html%'
    OR content LIKE '%sofas/size/pluffy-arm-1018564.html%'
    OR content LIKE '%sofas/size/pluffy-arm-1018571.html%'
    OR content LIKE '%sofas/size/pluffy-arm-1018578.html%'
    OR content LIKE '%sofas/size/pluffy-armless-1018599.html%'
    OR content LIKE '%sofas/size/pluffy-chaise-1018585.html%'
    OR content LIKE '%sofas/size/pluffy-chaise-1018592.html%'
    OR content LIKE '%sydney-140-ceramic-diningtable.html%'
    OR content LIKE '%sydney-159-ceramic-diningtable.html%'
    OR content LIKE '%sydney-159-tanceramic-diningtable.html%'
    OR content LIKE '%sydney-140-tanceramic-diningtable.html%'
    OR content LIKE '%sydney-180-ceramic-diningtable.html%'

UNION ALL

-- 查詢 CMS 區塊
SELECT 
    'CMS Block' AS location_type,
    block_id,
    title,
    identifier AS block_identifier,
    CASE 
        WHEN content LIKE '%pluffy-chaise-1018585.html%' THEN 'pluffy-chaise-1018585.html'
        WHEN content LIKE '%pluffy-ottoman-1018606.html%' THEN 'pluffy-ottoman-1018606.html'
        WHEN content LIKE '%pluffy-chaise-1018592.html%' THEN 'pluffy-chaise-1018592.html'
        WHEN content LIKE '%pluffy-ottoman-1018613.html%' THEN 'pluffy-ottoman-1018613.html'
        WHEN content LIKE '%modular-sofa-pluffy-5451.html%' THEN 'modular-sofa-pluffy-5451.html'
        WHEN content LIKE '%modular-sofa-pluffy-5454.html%' THEN 'modular-sofa-pluffy-5454.html'
        WHEN content LIKE '%modular-sofa-pluffy-5457.html%' THEN 'modular-sofa-pluffy-5457.html'
        WHEN content LIKE '%modular-sofa-pluffy-5460.html%' THEN 'modular-sofa-pluffy-5460.html'
        WHEN content LIKE '%modular-sofa-pluffy-5463.html%' THEN 'modular-sofa-pluffy-5463.html'
        WHEN content LIKE '%modular-sofa-pluffy-5466.html%' THEN 'modular-sofa-pluffy-5466.html'
        WHEN content LIKE '%modular-sofa-pluffy-5469.html%' THEN 'modular-sofa-pluffy-5469.html'
        WHEN content LIKE '%pluffy-arm-1018564.html%' THEN 'pluffy-arm-1018564.html'
        WHEN content LIKE '%pluffy-arm-1018557.html%' THEN 'pluffy-arm-1018557.html'
        WHEN content LIKE '%pluffy-arm-1018571.html%' THEN 'pluffy-arm-1018571.html'
        WHEN content LIKE '%pluffy-arm-1018578.html%' THEN 'pluffy-arm-1018578.html'
        WHEN content LIKE '%pluffy-armless-1018599.html%' THEN 'pluffy-armless-1018599.html'
        WHEN content LIKE '%electric-leather-sofa-1018278.html%' THEN 'electric-leather-sofa-1018278.html'
        WHEN content LIKE '%electric-leather-sofa-1018279.html%' THEN 'electric-leather-sofa-1018279.html'
        WHEN content LIKE '%electric-leather-sofa-1018281.html%' THEN 'electric-leather-sofa-1018281.html'
        WHEN content LIKE '%electric-leather-sofa-1018282.html%' THEN 'electric-leather-sofa-1018282.html'
        WHEN content LIKE '%electric-leather-sofa-1018284.html%' THEN 'electric-leather-sofa-1018284.html'
        WHEN content LIKE '%electric-leather-sofa-1018285.html%' THEN 'electric-leather-sofa-1018285.html'
        WHEN content LIKE '%electric-leather-sofa-1018287.html%' THEN 'electric-leather-sofa-1018287.html'
        WHEN content LIKE '%electric-leather-sofa-1018288.html%' THEN 'electric-leather-sofa-1018288.html'
        WHEN content LIKE '%gl-sheets-b-single.html%' THEN 'gl-sheets-b-single.html'
        WHEN content LIKE '%gl-sheets-dg-queen.html%' THEN 'gl-sheets-dg-queen.html'
        WHEN content LIKE '%gl-sheets-dg-single.html%' THEN 'gl-sheets-dg-single.html'
        WHEN content LIKE '%gl-sheets-g-queen.html%' THEN 'gl-sheets-g-queen.html'
        WHEN content LIKE '%gl-sheets-g-single.html%' THEN 'gl-sheets-g-single.html'
        WHEN content LIKE '%gl-sheets-p-single.html%' THEN 'gl-sheets-p-single.html'
        WHEN content LIKE '%gl-sheets-w-single.html%' THEN 'gl-sheets-w-single.html'
        WHEN content LIKE '%gl-sheets-p-queen.html%' THEN 'gl-sheets-p-queen.html'
        WHEN content LIKE '%gl-sheets-w-queen.html%' THEN 'gl-sheets-w-queen.html'
        WHEN content LIKE '%hermes.html%' THEN 'hermes.html'
        WHEN content LIKE '%homedecor-1018102.html%' THEN 'homedecor-1018102.html'
        WHEN content LIKE '%homedecor-1018115.html%' THEN 'homedecor-1018115.html'
        WHEN content LIKE '%homedecor-1018111.html%' THEN 'homedecor-1018111.html'
        WHEN content LIKE '%homedecor-1018130.html%' THEN 'homedecor-1018130.html'
        WHEN content LIKE '%homedecor-1018128.html%' THEN 'homedecor-1018128.html'
        WHEN content LIKE '%homedecor-1018127.html%' THEN 'homedecor-1018127.html'
        WHEN content LIKE '%homedecor-1018134.html%' THEN 'homedecor-1018134.html'
        WHEN content LIKE '%homedecor-1018136.html%' THEN 'homedecor-1018136.html'
        WHEN content LIKE '%homedecor-1018144.html%' THEN 'homedecor-1018144.html'
        WHEN content LIKE '%homedecor-1018145.html%' THEN 'homedecor-1018145.html'
        WHEN content LIKE '%homedecor-1018152.html%' THEN 'homedecor-1018152.html'
        WHEN content LIKE '%homedecor-1018156.html%' THEN 'homedecor-1018156.html'
        WHEN content LIKE '%homedecor-1018157.html%' THEN 'homedecor-1018157.html'
        WHEN content LIKE '%homedecor-1018153.html%' THEN 'homedecor-1018153.html'
        WHEN content LIKE '%homedecor-1018158.html%' THEN 'homedecor-1018158.html'
        WHEN content LIKE '%homedecor-1018159.html%' THEN 'homedecor-1018159.html'
        WHEN content LIKE '%homedecor-1018160.html%' THEN 'homedecor-1018160.html'
        WHEN content LIKE '%homedecor-1018167.html%' THEN 'homedecor-1018167.html'
        WHEN content LIKE '%homedecor-1018172.html%' THEN 'homedecor-1018172.html'
        WHEN content LIKE '%homedecor-1018166.html%' THEN 'homedecor-1018166.html'
        WHEN content LIKE '%homedecor-1018170.html%' THEN 'homedecor-1018170.html'
        WHEN content LIKE '%homedecor-1018173.html%' THEN 'homedecor-1018173.html'
        WHEN content LIKE '%homedecor-1018174.html%' THEN 'homedecor-1018174.html'
        WHEN content LIKE '%homedecor-1018179.html%' THEN 'homedecor-1018179.html'
        WHEN content LIKE '%homedecor-1018175.html%' THEN 'homedecor-1018175.html'
        WHEN content LIKE '%homedecor-1018181.html%' THEN 'homedecor-1018181.html'
        WHEN content LIKE '%homedecor-1018184.html%' THEN 'homedecor-1018184.html'
        WHEN content LIKE '%homedecor-1018183.html%' THEN 'homedecor-1018183.html'
        WHEN content LIKE '%homedecor-1018182.html%' THEN 'homedecor-1018182.html'
        WHEN content LIKE '%homedecor-1018185.html%' THEN 'homedecor-1018185.html'
        WHEN content LIKE '%homedecor-1018189.html%' THEN 'homedecor-1018189.html'
        WHEN content LIKE '%homedecor-1018191.html%' THEN 'homedecor-1018191.html'
        WHEN content LIKE '%homedecor-1018190.html%' THEN 'homedecor-1018190.html'
        WHEN content LIKE '%homedecor-1018194.html%' THEN 'homedecor-1018194.html'
        WHEN content LIKE '%homedecor-1018196.html%' THEN 'homedecor-1018196.html'
        WHEN content LIKE '%homedecor-1018198.html%' THEN 'homedecor-1018198.html'
        WHEN content LIKE '%homedecor-1018206.html%' THEN 'homedecor-1018206.html'
        WHEN content LIKE '%homedecor-1018208.html%' THEN 'homedecor-1018208.html'
        WHEN content LIKE '%homedecor-1018209.html%' THEN 'homedecor-1018209.html'
        WHEN content LIKE '%loungechair-1018223.html%' THEN 'loungechair-1018223.html'
        WHEN content LIKE '%loungechair-1018224.html%' THEN 'loungechair-1018224.html'
        WHEN content LIKE '%loungechair-1018225.html%' THEN 'loungechair-1018225.html'
        WHEN content LIKE '%loungechair-1018227.html%' THEN 'loungechair-1018227.html'
        WHEN content LIKE '%loungechair-1018226.html%' THEN 'loungechair-1018226.html'
        WHEN content LIKE '%loungechair-1018228.html%' THEN 'loungechair-1018228.html'
        WHEN content LIKE '%modular-sofa-dune-5707.html%' THEN 'modular-sofa-dune-5707.html'
        WHEN content LIKE '%modular-sofa-dune-5708.html%' THEN 'modular-sofa-dune-5708.html'
        WHEN content LIKE '%sofas-nordic-rufus-rhf-light-grey.html%' THEN 'sofas-nordic-rufus-rhf-light-grey.html'
        WHEN content LIKE '%sofas/pluffy-arm-1018557.html%' THEN 'sofas/pluffy-arm-1018557.html'
        WHEN content LIKE '%sofas/pluffy-arm-1018564.html%' THEN 'sofas/pluffy-arm-1018564.html'
        WHEN content LIKE '%sofas/pluffy-arm-1018571.html%' THEN 'sofas/pluffy-arm-1018571.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018557.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018564.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018571.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018578.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%' THEN 'sofas/size/modular-seating/pluffy-armless-1018599.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%' THEN 'sofas/size/modular-seating/pluffy-chaise-1018585.html'
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%' THEN 'sofas/size/modular-seating/pluffy-chaise-1018592.html'
        WHEN content LIKE '%sofas/size/pluffy-arm-1018557.html%' THEN 'sofas/size/pluffy-arm-1018557.html'
        WHEN content LIKE '%sofas/size/pluffy-arm-1018564.html%' THEN 'sofas/size/pluffy-arm-1018564.html'
        WHEN content LIKE '%sofas/size/pluffy-arm-1018571.html%' THEN 'sofas/size/pluffy-arm-1018571.html'
        WHEN content LIKE '%sofas/size/pluffy-arm-1018578.html%' THEN 'sofas/size/pluffy-arm-1018578.html'
        WHEN content LIKE '%sofas/size/pluffy-armless-1018599.html%' THEN 'sofas/size/pluffy-armless-1018599.html'
        WHEN content LIKE '%sofas/size/pluffy-chaise-1018585.html%' THEN 'sofas/size/pluffy-chaise-1018585.html'
        WHEN content LIKE '%sofas/size/pluffy-chaise-1018592.html%' THEN 'sofas/size/pluffy-chaise-1018592.html'
        WHEN content LIKE '%sydney-140-ceramic-diningtable.html%' THEN 'sydney-140-ceramic-diningtable.html'
        WHEN content LIKE '%sydney-159-ceramic-diningtable.html%' THEN 'sydney-159-ceramic-diningtable.html'
        WHEN content LIKE '%sydney-159-tanceramic-diningtable.html%' THEN 'sydney-159-tanceramic-diningtable.html'
        WHEN content LIKE '%sydney-140-tanceramic-diningtable.html%' THEN 'sydney-140-tanceramic-diningtable.html'
        WHEN content LIKE '%sydney-180-ceramic-diningtable.html%' THEN 'sydney-180-ceramic-diningtable.html'
        ELSE 'unknown'
    END AS matched_url,
    -- 提取上下文
    CASE 
        WHEN content LIKE '%pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-chaise-1018585.html', content) - 50), 
                LENGTH('pluffy-chaise-1018585.html') + 100)
        WHEN content LIKE '%pluffy-ottoman-1018606.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-ottoman-1018606.html', content) - 50), 
                LENGTH('pluffy-ottoman-1018606.html') + 100)
        WHEN content LIKE '%pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-chaise-1018592.html', content) - 50), 
                LENGTH('pluffy-chaise-1018592.html') + 100)
        WHEN content LIKE '%pluffy-ottoman-1018613.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-ottoman-1018613.html', content) - 50), 
                LENGTH('pluffy-ottoman-1018613.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5451.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5451.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5451.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5454.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5454.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5454.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5457.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5457.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5457.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5460.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5460.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5460.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5463.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5463.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5463.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5466.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5466.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5466.html') + 100)
        WHEN content LIKE '%modular-sofa-pluffy-5469.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5469.html', content) - 50), 
                LENGTH('modular-sofa-pluffy-5469.html') + 100)
        WHEN content LIKE '%pluffy-arm-1018564.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-arm-1018564.html', content) - 50), 
                LENGTH('pluffy-arm-1018564.html') + 100)
        WHEN content LIKE '%pluffy-arm-1018557.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-arm-1018557.html', content) - 50), 
                LENGTH('pluffy-arm-1018557.html') + 100)
        WHEN content LIKE '%pluffy-arm-1018571.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-arm-1018571.html', content) - 50), 
                LENGTH('pluffy-arm-1018571.html') + 100)
        WHEN content LIKE '%pluffy-arm-1018578.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-arm-1018578.html', content) - 50), 
                LENGTH('pluffy-arm-1018578.html') + 100)
        WHEN content LIKE '%pluffy-armless-1018599.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('pluffy-armless-1018599.html', content) - 50), 
                LENGTH('pluffy-armless-1018599.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018278.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018278.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018278.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018279.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018279.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018279.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018281.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018281.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018281.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018282.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018282.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018282.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018284.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018284.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018284.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018285.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018285.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018285.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018287.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018287.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018287.html') + 100)
        WHEN content LIKE '%electric-leather-sofa-1018288.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018288.html', content) - 50), 
                LENGTH('electric-leather-sofa-1018288.html') + 100)
        WHEN content LIKE '%gl-sheets-b-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-b-single.html', content) - 50), 
                LENGTH('gl-sheets-b-single.html') + 100)
        WHEN content LIKE '%gl-sheets-dg-queen.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-dg-queen.html', content) - 50), 
                LENGTH('gl-sheets-dg-queen.html') + 100)
        WHEN content LIKE '%gl-sheets-dg-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-dg-single.html', content) - 50), 
                LENGTH('gl-sheets-dg-single.html') + 100)
        WHEN content LIKE '%gl-sheets-g-queen.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-g-queen.html', content) - 50), 
                LENGTH('gl-sheets-g-queen.html') + 100)
        WHEN content LIKE '%gl-sheets-g-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-g-single.html', content) - 50), 
                LENGTH('gl-sheets-g-single.html') + 100)
        WHEN content LIKE '%gl-sheets-p-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-p-single.html', content) - 50), 
                LENGTH('gl-sheets-p-single.html') + 100)
        WHEN content LIKE '%gl-sheets-w-single.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-w-single.html', content) - 50), 
                LENGTH('gl-sheets-w-single.html') + 100)
        WHEN content LIKE '%gl-sheets-p-queen.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-p-queen.html', content) - 50), 
                LENGTH('gl-sheets-p-queen.html') + 100)
        WHEN content LIKE '%gl-sheets-w-queen.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('gl-sheets-w-queen.html', content) - 50), 
                LENGTH('gl-sheets-w-queen.html') + 100)
        WHEN content LIKE '%hermes.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('hermes.html', content) - 50), 
                LENGTH('hermes.html') + 100)
        WHEN content LIKE '%homedecor-1018102.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018102.html', content) - 50), 
                LENGTH('homedecor-1018102.html') + 100)
        WHEN content LIKE '%homedecor-1018115.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018115.html', content) - 50), 
                LENGTH('homedecor-1018115.html') + 100)
        WHEN content LIKE '%homedecor-1018111.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018111.html', content) - 50), 
                LENGTH('homedecor-1018111.html') + 100)
        WHEN content LIKE '%homedecor-1018130.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018130.html', content) - 50), 
                LENGTH('homedecor-1018130.html') + 100)
        WHEN content LIKE '%homedecor-1018128.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018128.html', content) - 50), 
                LENGTH('homedecor-1018128.html') + 100)
        WHEN content LIKE '%homedecor-1018127.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018127.html', content) - 50), 
                LENGTH('homedecor-1018127.html') + 100)
        WHEN content LIKE '%homedecor-1018134.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018134.html', content) - 50), 
                LENGTH('homedecor-1018134.html') + 100)
        WHEN content LIKE '%homedecor-1018136.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018136.html', content) - 50), 
                LENGTH('homedecor-1018136.html') + 100)
        WHEN content LIKE '%homedecor-1018144.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018144.html', content) - 50), 
                LENGTH('homedecor-1018144.html') + 100)
        WHEN content LIKE '%homedecor-1018145.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018145.html', content) - 50), 
                LENGTH('homedecor-1018145.html') + 100)
        WHEN content LIKE '%homedecor-1018152.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018152.html', content) - 50), 
                LENGTH('homedecor-1018152.html') + 100)
        WHEN content LIKE '%homedecor-1018156.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018156.html', content) - 50), 
                LENGTH('homedecor-1018156.html') + 100)
        WHEN content LIKE '%homedecor-1018157.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018157.html', content) - 50), 
                LENGTH('homedecor-1018157.html') + 100)
        WHEN content LIKE '%homedecor-1018153.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018153.html', content) - 50), 
                LENGTH('homedecor-1018153.html') + 100)
        WHEN content LIKE '%homedecor-1018158.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018158.html', content) - 50), 
                LENGTH('homedecor-1018158.html') + 100)
        WHEN content LIKE '%homedecor-1018159.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018159.html', content) - 50), 
                LENGTH('homedecor-1018159.html') + 100)
        WHEN content LIKE '%homedecor-1018160.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018160.html', content) - 50), 
                LENGTH('homedecor-1018160.html') + 100)
        WHEN content LIKE '%homedecor-1018167.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018167.html', content) - 50), 
                LENGTH('homedecor-1018167.html') + 100)
        WHEN content LIKE '%homedecor-1018172.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018172.html', content) - 50), 
                LENGTH('homedecor-1018172.html') + 100)
        WHEN content LIKE '%homedecor-1018166.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018166.html', content) - 50), 
                LENGTH('homedecor-1018166.html') + 100)
        WHEN content LIKE '%homedecor-1018170.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018170.html', content) - 50), 
                LENGTH('homedecor-1018170.html') + 100)
        WHEN content LIKE '%homedecor-1018173.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018173.html', content) - 50), 
                LENGTH('homedecor-1018173.html') + 100)
        WHEN content LIKE '%homedecor-1018174.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018174.html', content) - 50), 
                LENGTH('homedecor-1018174.html') + 100)
        WHEN content LIKE '%homedecor-1018179.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018179.html', content) - 50), 
                LENGTH('homedecor-1018179.html') + 100)
        WHEN content LIKE '%homedecor-1018175.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018175.html', content) - 50), 
                LENGTH('homedecor-1018175.html') + 100)
        WHEN content LIKE '%homedecor-1018181.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018181.html', content) - 50), 
                LENGTH('homedecor-1018181.html') + 100)
        WHEN content LIKE '%homedecor-1018184.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018184.html', content) - 50), 
                LENGTH('homedecor-1018184.html') + 100)
        WHEN content LIKE '%homedecor-1018183.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018183.html', content) - 50), 
                LENGTH('homedecor-1018183.html') + 100)
        WHEN content LIKE '%homedecor-1018182.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018182.html', content) - 50), 
                LENGTH('homedecor-1018182.html') + 100)
        WHEN content LIKE '%homedecor-1018185.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018185.html', content) - 50), 
                LENGTH('homedecor-1018185.html') + 100)
        WHEN content LIKE '%homedecor-1018189.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018189.html', content) - 50), 
                LENGTH('homedecor-1018189.html') + 100)
        WHEN content LIKE '%homedecor-1018191.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018191.html', content) - 50), 
                LENGTH('homedecor-1018191.html') + 100)
        WHEN content LIKE '%homedecor-1018190.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018190.html', content) - 50), 
                LENGTH('homedecor-1018190.html') + 100)
        WHEN content LIKE '%homedecor-1018194.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018194.html', content) - 50), 
                LENGTH('homedecor-1018194.html') + 100)
        WHEN content LIKE '%homedecor-1018196.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018196.html', content) - 50), 
                LENGTH('homedecor-1018196.html') + 100)
        WHEN content LIKE '%homedecor-1018198.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018198.html', content) - 50), 
                LENGTH('homedecor-1018198.html') + 100)
        WHEN content LIKE '%homedecor-1018206.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018206.html', content) - 50), 
                LENGTH('homedecor-1018206.html') + 100)
        WHEN content LIKE '%homedecor-1018208.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018208.html', content) - 50), 
                LENGTH('homedecor-1018208.html') + 100)
        WHEN content LIKE '%homedecor-1018209.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('homedecor-1018209.html', content) - 50), 
                LENGTH('homedecor-1018209.html') + 100)
        WHEN content LIKE '%loungechair-1018223.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018223.html', content) - 50), 
                LENGTH('loungechair-1018223.html') + 100)
        WHEN content LIKE '%loungechair-1018224.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018224.html', content) - 50), 
                LENGTH('loungechair-1018224.html') + 100)
        WHEN content LIKE '%loungechair-1018225.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018225.html', content) - 50), 
                LENGTH('loungechair-1018225.html') + 100)
        WHEN content LIKE '%loungechair-1018227.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018227.html', content) - 50), 
                LENGTH('loungechair-1018227.html') + 100)
        WHEN content LIKE '%loungechair-1018226.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018226.html', content) - 50), 
                LENGTH('loungechair-1018226.html') + 100)
        WHEN content LIKE '%loungechair-1018228.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('loungechair-1018228.html', content) - 50), 
                LENGTH('loungechair-1018228.html') + 100)
        WHEN content LIKE '%modular-sofa-dune-5707.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-dune-5707.html', content) - 50), 
                LENGTH('modular-sofa-dune-5707.html') + 100)
        WHEN content LIKE '%modular-sofa-dune-5708.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('modular-sofa-dune-5708.html', content) - 50), 
                LENGTH('modular-sofa-dune-5708.html') + 100)
        WHEN content LIKE '%sofas-nordic-rufus-rhf-light-grey.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas-nordic-rufus-rhf-light-grey.html', content) - 50), 
                LENGTH('sofas-nordic-rufus-rhf-light-grey.html') + 100)
        WHEN content LIKE '%sofas/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018557.html', content) - 50), 
                LENGTH('sofas/pluffy-arm-1018557.html') + 100)
        WHEN content LIKE '%sofas/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018564.html', content) - 50), 
                LENGTH('sofas/pluffy-arm-1018564.html') + 100)
        WHEN content LIKE '%sofas/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018571.html', content) - 50), 
                LENGTH('sofas/pluffy-arm-1018571.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018557.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018557.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018564.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018564.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018571.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018571.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018578.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018578.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-armless-1018599.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-armless-1018599.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-chaise-1018585.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-chaise-1018585.html') + 100)
        WHEN content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-chaise-1018592.html', content) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-chaise-1018592.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018557.html', content) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018557.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018564.html', content) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018564.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018571.html', content) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018571.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-arm-1018578.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018578.html', content) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018578.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-armless-1018599.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-armless-1018599.html', content) - 50), 
                LENGTH('sofas/size/pluffy-armless-1018599.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-chaise-1018585.html', content) - 50), 
                LENGTH('sofas/size/pluffy-chaise-1018585.html') + 100)
        WHEN content LIKE '%sofas/size/pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sofas/size/pluffy-chaise-1018592.html', content) - 50), 
                LENGTH('sofas/size/pluffy-chaise-1018592.html') + 100)
        WHEN content LIKE '%sydney-140-ceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-140-ceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-140-ceramic-diningtable.html') + 100)
        WHEN content LIKE '%sydney-159-ceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-159-ceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-159-ceramic-diningtable.html') + 100)
        WHEN content LIKE '%sydney-159-tanceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-159-tanceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-159-tanceramic-diningtable.html') + 100)
        WHEN content LIKE '%sydney-140-tanceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-140-tanceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-140-tanceramic-diningtable.html') + 100)
        WHEN content LIKE '%sydney-180-ceramic-diningtable.html%' THEN 
            SUBSTRING(content, 
                GREATEST(1, LOCATE('sydney-180-ceramic-diningtable.html', content) - 50), 
                LENGTH('sydney-180-ceramic-diningtable.html') + 100)
        ELSE SUBSTRING(content, 1, 200) -- 如果沒有匹配特定的 URL 模式，則提取前 200 個字符
    END AS url_context
FROM 
    cms_block
WHERE 
    content LIKE '%pluffy-chaise-1018585.html%'
    OR content LIKE '%pluffy-ottoman-1018606.html%'
    OR content LIKE '%pluffy-chaise-1018592.html%'
    OR content LIKE '%pluffy-ottoman-1018613.html%'
    OR content LIKE '%modular-sofa-pluffy-5451.html%'
    OR content LIKE '%modular-sofa-pluffy-5454.html%'
    OR content LIKE '%modular-sofa-pluffy-5457.html%'
    OR content LIKE '%modular-sofa-pluffy-5460.html%'
    OR content LIKE '%modular-sofa-pluffy-5463.html%'
    OR content LIKE '%modular-sofa-pluffy-5466.html%'
    OR content LIKE '%modular-sofa-pluffy-5469.html%'
    OR content LIKE '%pluffy-arm-1018564.html%'
    OR content LIKE '%pluffy-arm-1018557.html%'
    OR content LIKE '%pluffy-arm-1018571.html%'
    OR content LIKE '%pluffy-arm-1018578.html%'
    OR content LIKE '%pluffy-armless-1018599.html%'
    OR content LIKE '%electric-leather-sofa-1018278.html%'
    OR content LIKE '%electric-leather-sofa-1018279.html%'
    OR content LIKE '%electric-leather-sofa-1018281.html%'
    OR content LIKE '%electric-leather-sofa-1018282.html%'
    OR content LIKE '%electric-leather-sofa-1018284.html%'
    OR content LIKE '%electric-leather-sofa-1018285.html%'
    OR content LIKE '%electric-leather-sofa-1018287.html%'
    OR content LIKE '%electric-leather-sofa-1018288.html%'
    OR content LIKE '%gl-sheets-b-single.html%'
    OR content LIKE '%gl-sheets-dg-queen.html%'
    OR content LIKE '%gl-sheets-dg-single.html%'
    OR content LIKE '%gl-sheets-g-queen.html%'
    OR content LIKE '%gl-sheets-g-single.html%'
    OR content LIKE '%gl-sheets-p-single.html%'
    OR content LIKE '%gl-sheets-w-single.html%'
    OR content LIKE '%gl-sheets-p-queen.html%'
    OR content LIKE '%gl-sheets-w-queen.html%'
    OR content LIKE '%hermes.html%'
    OR content LIKE '%homedecor-1018102.html%'
    OR content LIKE '%homedecor-1018115.html%'
    OR content LIKE '%homedecor-1018111.html%'
    OR content LIKE '%homedecor-1018130.html%'
    OR content LIKE '%homedecor-1018128.html%'
    OR content LIKE '%homedecor-1018127.html%'
    OR content LIKE '%homedecor-1018134.html%'
    OR content LIKE '%homedecor-1018136.html%'
    OR content LIKE '%homedecor-1018144.html%'
    OR content LIKE '%homedecor-1018145.html%'
    OR content LIKE '%homedecor-1018152.html%'
    OR content LIKE '%homedecor-1018156.html%'
    OR content LIKE '%homedecor-1018157.html%'
    OR content LIKE '%homedecor-1018153.html%'
    OR content LIKE '%homedecor-1018158.html%'
    OR content LIKE '%homedecor-1018159.html%'
    OR content LIKE '%homedecor-1018160.html%'
    OR content LIKE '%homedecor-1018167.html%'
    OR content LIKE '%homedecor-1018172.html%'
    OR content LIKE '%homedecor-1018166.html%'
    OR content LIKE '%homedecor-1018170.html%'
    OR content LIKE '%homedecor-1018173.html%'
    OR content LIKE '%homedecor-1018174.html%'
    OR content LIKE '%homedecor-1018179.html%'
    OR content LIKE '%homedecor-1018175.html%'
    OR content LIKE '%homedecor-1018181.html%'
    OR content LIKE '%homedecor-1018184.html%'
    OR content LIKE '%homedecor-1018183.html%'
    OR content LIKE '%homedecor-1018182.html%'
    OR content LIKE '%homedecor-1018185.html%'
    OR content LIKE '%homedecor-1018189.html%'
    OR content LIKE '%homedecor-1018191.html%'
    OR content LIKE '%homedecor-1018190.html%'
    OR content LIKE '%homedecor-1018194.html%'
    OR content LIKE '%homedecor-1018196.html%'
    OR content LIKE '%homedecor-1018198.html%'
    OR content LIKE '%homedecor-1018206.html%'
    OR content LIKE '%homedecor-1018208.html%'
    OR content LIKE '%homedecor-1018209.html%'
    OR content LIKE '%loungechair-1018223.html%'
    OR content LIKE '%loungechair-1018224.html%'
    OR content LIKE '%loungechair-1018225.html%'
    OR content LIKE '%loungechair-1018227.html%'
    OR content LIKE '%loungechair-1018226.html%'
    OR content LIKE '%loungechair-1018228.html%'
    OR content LIKE '%modular-sofa-dune-5707.html%'
    OR content LIKE '%modular-sofa-dune-5708.html%'
    OR content LIKE '%sofas-nordic-rufus-rhf-light-grey.html%'
    OR content LIKE '%sofas/pluffy-arm-1018557.html%'
    OR content LIKE '%sofas/pluffy-arm-1018564.html%'
    OR content LIKE '%sofas/pluffy-arm-1018571.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%'
    OR content LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%'
    OR content LIKE '%sofas/size/pluffy-arm-1018557.html%'
    OR content LIKE '%sofas/size/pluffy-arm-1018564.html%'
    OR content LIKE '%sofas/size/pluffy-arm-1018571.html%'
    OR content LIKE '%sofas/size/pluffy-arm-1018578.html%'
    OR content LIKE '%sofas/size/pluffy-armless-1018599.html%'
    OR content LIKE '%sofas/size/pluffy-chaise-1018585.html%'
    OR content LIKE '%sofas/size/pluffy-chaise-1018592.html%'
    OR content LIKE '%sydney-140-ceramic-diningtable.html%'
    OR content LIKE '%sydney-159-ceramic-diningtable.html%'
    OR content LIKE '%sydney-159-tanceramic-diningtable.html%'
    OR content LIKE '%sydney-140-tanceramic-diningtable.html%'
    OR content LIKE '%sydney-180-ceramic-diningtable.html%'

UNION ALL

-- 查詢產品描述
SELECT 
    'Product Description' AS location_type,
    cpev.entity_id AS product_id,
    cpe.sku AS title,
    '' AS page_url,
    CASE 
        WHEN cpev.value LIKE '%pluffy-chaise-1018585.html%' THEN 'pluffy-chaise-1018585.html'
        WHEN cpev.value LIKE '%pluffy-ottoman-1018606.html%' THEN 'pluffy-ottoman-1018606.html'
        WHEN cpev.value LIKE '%pluffy-chaise-1018592.html%' THEN 'pluffy-chaise-1018592.html'
        WHEN cpev.value LIKE '%pluffy-ottoman-1018613.html%' THEN 'pluffy-ottoman-1018613.html'
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5451.html%' THEN 'modular-sofa-pluffy-5451.html'
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5454.html%' THEN 'modular-sofa-pluffy-5454.html'
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5457.html%' THEN 'modular-sofa-pluffy-5457.html'
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5460.html%' THEN 'modular-sofa-pluffy-5460.html'
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5463.html%' THEN 'modular-sofa-pluffy-5463.html'
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5466.html%' THEN 'modular-sofa-pluffy-5466.html'
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5469.html%' THEN 'modular-sofa-pluffy-5469.html'
        WHEN cpev.value LIKE '%pluffy-arm-1018564.html%' THEN 'pluffy-arm-1018564.html'
        WHEN cpev.value LIKE '%pluffy-arm-1018557.html%' THEN 'pluffy-arm-1018557.html'
        WHEN cpev.value LIKE '%pluffy-arm-1018571.html%' THEN 'pluffy-arm-1018571.html'
        WHEN cpev.value LIKE '%pluffy-arm-1018578.html%' THEN 'pluffy-arm-1018578.html'
        WHEN cpev.value LIKE '%pluffy-armless-1018599.html%' THEN 'pluffy-armless-1018599.html'
        WHEN cpev.value LIKE '%electric-leather-sofa-1018278.html%' THEN 'electric-leather-sofa-1018278.html'
        WHEN cpev.value LIKE '%electric-leather-sofa-1018279.html%' THEN 'electric-leather-sofa-1018279.html'
        WHEN cpev.value LIKE '%electric-leather-sofa-1018281.html%' THEN 'electric-leather-sofa-1018281.html'
        WHEN cpev.value LIKE '%electric-leather-sofa-1018282.html%' THEN 'electric-leather-sofa-1018282.html'
        WHEN cpev.value LIKE '%electric-leather-sofa-1018284.html%' THEN 'electric-leather-sofa-1018284.html'
        WHEN cpev.value LIKE '%electric-leather-sofa-1018285.html%' THEN 'electric-leather-sofa-1018285.html'
        WHEN cpev.value LIKE '%electric-leather-sofa-1018287.html%' THEN 'electric-leather-sofa-1018287.html'
        WHEN cpev.value LIKE '%electric-leather-sofa-1018288.html%' THEN 'electric-leather-sofa-1018288.html'
        WHEN cpev.value LIKE '%gl-sheets-b-single.html%' THEN 'gl-sheets-b-single.html'
        WHEN cpev.value LIKE '%gl-sheets-dg-queen.html%' THEN 'gl-sheets-dg-queen.html'
        WHEN cpev.value LIKE '%gl-sheets-dg-single.html%' THEN 'gl-sheets-dg-single.html'
        WHEN cpev.value LIKE '%gl-sheets-g-queen.html%' THEN 'gl-sheets-g-queen.html'
        WHEN cpev.value LIKE '%gl-sheets-g-single.html%' THEN 'gl-sheets-g-single.html'
        WHEN cpev.value LIKE '%gl-sheets-p-single.html%' THEN 'gl-sheets-p-single.html'
        WHEN cpev.value LIKE '%gl-sheets-w-single.html%' THEN 'gl-sheets-w-single.html'
        WHEN cpev.value LIKE '%gl-sheets-p-queen.html%' THEN 'gl-sheets-p-queen.html'
        WHEN cpev.value LIKE '%gl-sheets-w-queen.html%' THEN 'gl-sheets-w-queen.html'
        WHEN cpev.value LIKE '%hermes.html%' THEN 'hermes.html'
        WHEN cpev.value LIKE '%homedecor-1018102.html%' THEN 'homedecor-1018102.html'
        WHEN cpev.value LIKE '%homedecor-1018115.html%' THEN 'homedecor-1018115.html'
        WHEN cpev.value LIKE '%homedecor-1018111.html%' THEN 'homedecor-1018111.html'
        WHEN cpev.value LIKE '%homedecor-1018130.html%' THEN 'homedecor-1018130.html'
        WHEN cpev.value LIKE '%homedecor-1018128.html%' THEN 'homedecor-1018128.html'
        WHEN cpev.value LIKE '%homedecor-1018127.html%' THEN 'homedecor-1018127.html'
        WHEN cpev.value LIKE '%homedecor-1018134.html%' THEN 'homedecor-1018134.html'
        WHEN cpev.value LIKE '%homedecor-1018136.html%' THEN 'homedecor-1018136.html'
        WHEN cpev.value LIKE '%homedecor-1018144.html%' THEN 'homedecor-1018144.html'
        WHEN cpev.value LIKE '%homedecor-1018145.html%' THEN 'homedecor-1018145.html'
        WHEN cpev.value LIKE '%homedecor-1018152.html%' THEN 'homedecor-1018152.html'
        WHEN cpev.value LIKE '%homedecor-1018156.html%' THEN 'homedecor-1018156.html'
        WHEN cpev.value LIKE '%homedecor-1018157.html%' THEN 'homedecor-1018157.html'
        WHEN cpev.value LIKE '%homedecor-1018153.html%' THEN 'homedecor-1018153.html'
        WHEN cpev.value LIKE '%homedecor-1018158.html%' THEN 'homedecor-1018158.html'
        WHEN cpev.value LIKE '%homedecor-1018159.html%' THEN 'homedecor-1018159.html'
        WHEN cpev.value LIKE '%homedecor-1018160.html%' THEN 'homedecor-1018160.html'
        WHEN cpev.value LIKE '%homedecor-1018167.html%' THEN 'homedecor-1018167.html'
        WHEN cpev.value LIKE '%homedecor-1018172.html%' THEN 'homedecor-1018172.html'
        WHEN cpev.value LIKE '%homedecor-1018166.html%' THEN 'homedecor-1018166.html'
        WHEN cpev.value LIKE '%homedecor-1018170.html%' THEN 'homedecor-1018170.html'
        WHEN cpev.value LIKE '%homedecor-1018173.html%' THEN 'homedecor-1018173.html'
        WHEN cpev.value LIKE '%homedecor-1018174.html%' THEN 'homedecor-1018174.html'
        WHEN cpev.value LIKE '%homedecor-1018179.html%' THEN 'homedecor-1018179.html'
        WHEN cpev.value LIKE '%homedecor-1018175.html%' THEN 'homedecor-1018175.html'
        WHEN cpev.value LIKE '%homedecor-1018181.html%' THEN 'homedecor-1018181.html'
        WHEN cpev.value LIKE '%homedecor-1018184.html%' THEN 'homedecor-1018184.html'
        WHEN cpev.value LIKE '%homedecor-1018183.html%' THEN 'homedecor-1018183.html'
        WHEN cpev.value LIKE '%homedecor-1018182.html%' THEN 'homedecor-1018182.html'
        WHEN cpev.value LIKE '%homedecor-1018185.html%' THEN 'homedecor-1018185.html'
        WHEN cpev.value LIKE '%homedecor-1018189.html%' THEN 'homedecor-1018189.html'
        WHEN cpev.value LIKE '%homedecor-1018191.html%' THEN 'homedecor-1018191.html'
        WHEN cpev.value LIKE '%homedecor-1018190.html%' THEN 'homedecor-1018190.html'
        WHEN cpev.value LIKE '%homedecor-1018194.html%' THEN 'homedecor-1018194.html'
        WHEN cpev.value LIKE '%homedecor-1018196.html%' THEN 'homedecor-1018196.html'
        WHEN cpev.value LIKE '%homedecor-1018198.html%' THEN 'homedecor-1018198.html'
        WHEN cpev.value LIKE '%homedecor-1018206.html%' THEN 'homedecor-1018206.html'
        WHEN cpev.value LIKE '%homedecor-1018208.html%' THEN 'homedecor-1018208.html'
        WHEN cpev.value LIKE '%homedecor-1018209.html%' THEN 'homedecor-1018209.html'
        WHEN cpev.value LIKE '%loungechair-1018223.html%' THEN 'loungechair-1018223.html'
        WHEN cpev.value LIKE '%loungechair-1018224.html%' THEN 'loungechair-1018224.html'
        WHEN cpev.value LIKE '%loungechair-1018225.html%' THEN 'loungechair-1018225.html'
        WHEN cpev.value LIKE '%loungechair-1018227.html%' THEN 'loungechair-1018227.html'
        WHEN cpev.value LIKE '%loungechair-1018226.html%' THEN 'loungechair-1018226.html'
        WHEN cpev.value LIKE '%loungechair-1018228.html%' THEN 'loungechair-1018228.html'
        WHEN cpev.value LIKE '%modular-sofa-dune-5707.html%' THEN 'modular-sofa-dune-5707.html'
        WHEN cpev.value LIKE '%modular-sofa-dune-5708.html%' THEN 'modular-sofa-dune-5708.html'
        WHEN cpev.value LIKE '%sofas-nordic-rufus-rhf-light-grey.html%' THEN 'sofas-nordic-rufus-rhf-light-grey.html'
        WHEN cpev.value LIKE '%sofas/pluffy-arm-1018557.html%' THEN 'sofas/pluffy-arm-1018557.html'
        WHEN cpev.value LIKE '%sofas/pluffy-arm-1018564.html%' THEN 'sofas/pluffy-arm-1018564.html'
        WHEN cpev.value LIKE '%sofas/pluffy-arm-1018571.html%' THEN 'sofas/pluffy-arm-1018571.html'
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018557.html'
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018564.html'
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018571.html'
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%' THEN 'sofas/size/modular-seating/pluffy-arm-1018578.html'
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%' THEN 'sofas/size/modular-seating/pluffy-armless-1018599.html'
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%' THEN 'sofas/size/modular-seating/pluffy-chaise-1018585.html'
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%' THEN 'sofas/size/modular-seating/pluffy-chaise-1018592.html'
        WHEN cpev.value LIKE '%sofas/size/pluffy-arm-1018557.html%' THEN 'sofas/size/pluffy-arm-1018557.html'
        WHEN cpev.value LIKE '%sofas/size/pluffy-arm-1018564.html%' THEN 'sofas/size/pluffy-arm-1018564.html'
        WHEN cpev.value LIKE '%sofas/size/pluffy-arm-1018571.html%' THEN 'sofas/size/pluffy-arm-1018571.html'
        WHEN cpev.value LIKE '%sofas/size/pluffy-arm-1018578.html%' THEN 'sofas/size/pluffy-arm-1018578.html'
        WHEN cpev.value LIKE '%sofas/size/pluffy-armless-1018599.html%' THEN 'sofas/size/pluffy-armless-1018599.html'
        WHEN cpev.value LIKE '%sofas/size/pluffy-chaise-1018585.html%' THEN 'sofas/size/pluffy-chaise-1018585.html'
        WHEN cpev.value LIKE '%sofas/size/pluffy-chaise-1018592.html%' THEN 'sofas/size/pluffy-chaise-1018592.html'
        WHEN cpev.value LIKE '%sydney-140-ceramic-diningtable.html%' THEN 'sydney-140-ceramic-diningtable.html'
        WHEN cpev.value LIKE '%sydney-159-ceramic-diningtable.html%' THEN 'sydney-159-ceramic-diningtable.html'
        WHEN cpev.value LIKE '%sydney-159-tanceramic-diningtable.html%' THEN 'sydney-159-tanceramic-diningtable.html'
        WHEN cpev.value LIKE '%sydney-140-tanceramic-diningtable.html%' THEN 'sydney-140-tanceramic-diningtable.html'
        WHEN cpev.value LIKE '%sydney-180-ceramic-diningtable.html%' THEN 'sydney-180-ceramic-diningtable.html'
        ELSE 'unknown'
    END AS matched_url,
    -- 提取上下文
    CASE 
        WHEN cpev.value LIKE '%pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-chaise-1018585.html', cpev.value) - 50), 
                LENGTH('pluffy-chaise-1018585.html') + 100)
        WHEN cpev.value LIKE '%pluffy-ottoman-1018606.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-ottoman-1018606.html', cpev.value) - 50), 
                LENGTH('pluffy-ottoman-1018606.html') + 100)
        WHEN cpev.value LIKE '%pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-chaise-1018592.html', cpev.value) - 50), 
                LENGTH('pluffy-chaise-1018592.html') + 100)
        WHEN cpev.value LIKE '%pluffy-ottoman-1018613.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-ottoman-1018613.html', cpev.value) - 50), 
                LENGTH('pluffy-ottoman-1018613.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5451.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5451.html', cpev.value) - 50), 
                LENGTH('modular-sofa-pluffy-5451.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5454.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5454.html', cpev.value) - 50), 
                LENGTH('modular-sofa-pluffy-5454.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5457.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5457.html', cpev.value) - 50), 
                LENGTH('modular-sofa-pluffy-5457.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5460.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5460.html', cpev.value) - 50), 
                LENGTH('modular-sofa-pluffy-5460.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5463.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5463.html', cpev.value) - 50), 
                LENGTH('modular-sofa-pluffy-5463.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5466.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5466.html', cpev.value) - 50), 
                LENGTH('modular-sofa-pluffy-5466.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-pluffy-5469.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-pluffy-5469.html', cpev.value) - 50), 
                LENGTH('modular-sofa-pluffy-5469.html') + 100)
        WHEN cpev.value LIKE '%pluffy-arm-1018564.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-arm-1018564.html', cpev.value) - 50), 
                LENGTH('pluffy-arm-1018564.html') + 100)
        WHEN cpev.value LIKE '%pluffy-arm-1018557.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-arm-1018557.html', cpev.value) - 50), 
                LENGTH('pluffy-arm-1018557.html') + 100)
        WHEN cpev.value LIKE '%pluffy-arm-1018571.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-arm-1018571.html', cpev.value) - 50), 
                LENGTH('pluffy-arm-1018571.html') + 100)
        WHEN cpev.value LIKE '%pluffy-arm-1018578.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-arm-1018578.html', cpev.value) - 50), 
                LENGTH('pluffy-arm-1018578.html') + 100)
        WHEN cpev.value LIKE '%pluffy-armless-1018599.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('pluffy-armless-1018599.html', cpev.value) - 50), 
                LENGTH('pluffy-armless-1018599.html') + 100)
        WHEN cpev.value LIKE '%electric-leather-sofa-1018278.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018278.html', cpev.value) - 50), 
                LENGTH('electric-leather-sofa-1018278.html') + 100)
        WHEN cpev.value LIKE '%electric-leather-sofa-1018279.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018279.html', cpev.value) - 50), 
                LENGTH('electric-leather-sofa-1018279.html') + 100)
        WHEN cpev.value LIKE '%electric-leather-sofa-1018281.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018281.html', cpev.value) - 50), 
                LENGTH('electric-leather-sofa-1018281.html') + 100)
        WHEN cpev.value LIKE '%electric-leather-sofa-1018282.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018282.html', cpev.value) - 50), 
                LENGTH('electric-leather-sofa-1018282.html') + 100)
        WHEN cpev.value LIKE '%electric-leather-sofa-1018284.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018284.html', cpev.value) - 50), 
                LENGTH('electric-leather-sofa-1018284.html') + 100)
        WHEN cpev.value LIKE '%electric-leather-sofa-1018285.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018285.html', cpev.value) - 50), 
                LENGTH('electric-leather-sofa-1018285.html') + 100)
        WHEN cpev.value LIKE '%electric-leather-sofa-1018287.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018287.html', cpev.value) - 50), 
                LENGTH('electric-leather-sofa-1018287.html') + 100)
        WHEN cpev.value LIKE '%electric-leather-sofa-1018288.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('electric-leather-sofa-1018288.html', cpev.value) - 50), 
                LENGTH('electric-leather-sofa-1018288.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-b-single.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-b-single.html', cpev.value) - 50), 
                LENGTH('gl-sheets-b-single.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-dg-queen.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-dg-queen.html', cpev.value) - 50), 
                LENGTH('gl-sheets-dg-queen.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-dg-single.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-dg-single.html', cpev.value) - 50), 
                LENGTH('gl-sheets-dg-single.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-g-queen.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-g-queen.html', cpev.value) - 50), 
                LENGTH('gl-sheets-g-queen.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-g-single.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-g-single.html', cpev.value) - 50), 
                LENGTH('gl-sheets-g-single.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-p-single.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-p-single.html', cpev.value) - 50), 
                LENGTH('gl-sheets-p-single.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-w-single.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-w-single.html', cpev.value) - 50), 
                LENGTH('gl-sheets-w-single.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-p-queen.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-p-queen.html', cpev.value) - 50), 
                LENGTH('gl-sheets-p-queen.html') + 100)
        WHEN cpev.value LIKE '%gl-sheets-w-queen.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('gl-sheets-w-queen.html', cpev.value) - 50), 
                LENGTH('gl-sheets-w-queen.html') + 100)
        WHEN cpev.value LIKE '%hermes.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('hermes.html', cpev.value) - 50), 
                LENGTH('hermes.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018102.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018102.html', cpev.value) - 50), 
                LENGTH('homedecor-1018102.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018115.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018115.html', cpev.value) - 50), 
                LENGTH('homedecor-1018115.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018111.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018111.html', cpev.value) - 50), 
                LENGTH('homedecor-1018111.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018130.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018130.html', cpev.value) - 50), 
                LENGTH('homedecor-1018130.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018128.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018128.html', cpev.value) - 50), 
                LENGTH('homedecor-1018128.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018127.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018127.html', cpev.value) - 50), 
                LENGTH('homedecor-1018127.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018134.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018134.html', cpev.value) - 50), 
                LENGTH('homedecor-1018134.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018136.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018136.html', cpev.value) - 50), 
                LENGTH('homedecor-1018136.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018144.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018144.html', cpev.value) - 50), 
                LENGTH('homedecor-1018144.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018145.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018145.html', cpev.value) - 50), 
                LENGTH('homedecor-1018145.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018152.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018152.html', cpev.value) - 50), 
                LENGTH('homedecor-1018152.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018156.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018156.html', cpev.value) - 50), 
                LENGTH('homedecor-1018156.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018157.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018157.html', cpev.value) - 50), 
                LENGTH('homedecor-1018157.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018153.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018153.html', cpev.value) - 50), 
                LENGTH('homedecor-1018153.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018158.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018158.html', cpev.value) - 50), 
                LENGTH('homedecor-1018158.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018159.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018159.html', cpev.value) - 50), 
                LENGTH('homedecor-1018159.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018160.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018160.html', cpev.value) - 50), 
                LENGTH('homedecor-1018160.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018167.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018167.html', cpev.value) - 50), 
                LENGTH('homedecor-1018167.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018172.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018172.html', cpev.value) - 50), 
                LENGTH('homedecor-1018172.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018166.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018166.html', cpev.value) - 50), 
                LENGTH('homedecor-1018166.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018170.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018170.html', cpev.value) - 50), 
                LENGTH('homedecor-1018170.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018173.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018173.html', cpev.value) - 50), 
                LENGTH('homedecor-1018173.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018174.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018174.html', cpev.value) - 50), 
                LENGTH('homedecor-1018174.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018179.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018179.html', cpev.value) - 50), 
                LENGTH('homedecor-1018179.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018175.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018175.html', cpev.value) - 50), 
                LENGTH('homedecor-1018175.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018181.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018181.html', cpev.value) - 50), 
                LENGTH('homedecor-1018181.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018184.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018184.html', cpev.value) - 50), 
                LENGTH('homedecor-1018184.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018183.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018183.html', cpev.value) - 50), 
                LENGTH('homedecor-1018183.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018182.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018182.html', cpev.value) - 50), 
                LENGTH('homedecor-1018182.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018185.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018185.html', cpev.value) - 50), 
                LENGTH('homedecor-1018185.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018189.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018189.html', cpev.value) - 50), 
                LENGTH('homedecor-1018189.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018191.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018191.html', cpev.value) - 50), 
                LENGTH('homedecor-1018191.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018190.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018190.html', cpev.value) - 50), 
                LENGTH('homedecor-1018190.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018194.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018194.html', cpev.value) - 50), 
                LENGTH('homedecor-1018194.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018196.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018196.html', cpev.value) - 50), 
                LENGTH('homedecor-1018196.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018198.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018198.html', cpev.value) - 50), 
                LENGTH('homedecor-1018198.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018206.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018206.html', cpev.value) - 50), 
                LENGTH('homedecor-1018206.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018208.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018208.html', cpev.value) - 50), 
                LENGTH('homedecor-1018208.html') + 100)
        WHEN cpev.value LIKE '%homedecor-1018209.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('homedecor-1018209.html', cpev.value) - 50), 
                LENGTH('homedecor-1018209.html') + 100)
        WHEN cpev.value LIKE '%loungechair-1018223.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('loungechair-1018223.html', cpev.value) - 50), 
                LENGTH('loungechair-1018223.html') + 100)
        WHEN cpev.value LIKE '%loungechair-1018224.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('loungechair-1018224.html', cpev.value) - 50), 
                LENGTH('loungechair-1018224.html') + 100)
        WHEN cpev.value LIKE '%loungechair-1018225.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('loungechair-1018225.html', cpev.value) - 50), 
                LENGTH('loungechair-1018225.html') + 100)
        WHEN cpev.value LIKE '%loungechair-1018227.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('loungechair-1018227.html', cpev.value) - 50), 
                LENGTH('loungechair-1018227.html') + 100)
        WHEN cpev.value LIKE '%loungechair-1018226.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('loungechair-1018226.html', cpev.value) - 50), 
                LENGTH('loungechair-1018226.html') + 100)
        WHEN cpev.value LIKE '%loungechair-1018228.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('loungechair-1018228.html', cpev.value) - 50), 
                LENGTH('loungechair-1018228.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-dune-5707.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-dune-5707.html', cpev.value) - 50), 
                LENGTH('modular-sofa-dune-5707.html') + 100)
        WHEN cpev.value LIKE '%modular-sofa-dune-5708.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('modular-sofa-dune-5708.html', cpev.value) - 50), 
                LENGTH('modular-sofa-dune-5708.html') + 100)
        WHEN cpev.value LIKE '%sofas-nordic-rufus-rhf-light-grey.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas-nordic-rufus-rhf-light-grey.html', cpev.value) - 50), 
                LENGTH('sofas-nordic-rufus-rhf-light-grey.html') + 100)
        WHEN cpev.value LIKE '%sofas/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018557.html', cpev.value) - 50), 
                LENGTH('sofas/pluffy-arm-1018557.html') + 100)
        WHEN cpev.value LIKE '%sofas/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018564.html', cpev.value) - 50), 
                LENGTH('sofas/pluffy-arm-1018564.html') + 100)
        WHEN cpev.value LIKE '%sofas/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/pluffy-arm-1018571.html', cpev.value) - 50), 
                LENGTH('sofas/pluffy-arm-1018571.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018557.html', cpev.value) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018557.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018564.html', cpev.value) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018564.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018571.html', cpev.value) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018571.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-arm-1018578.html', cpev.value) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-arm-1018578.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-armless-1018599.html', cpev.value) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-armless-1018599.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-chaise-1018585.html', cpev.value) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-chaise-1018585.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/modular-seating/pluffy-chaise-1018592.html', cpev.value) - 50), 
                LENGTH('sofas/size/modular-seating/pluffy-chaise-1018592.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/pluffy-arm-1018557.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018557.html', cpev.value) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018557.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/pluffy-arm-1018564.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018564.html', cpev.value) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018564.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/pluffy-arm-1018571.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018571.html', cpev.value) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018571.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/pluffy-arm-1018578.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/pluffy-arm-1018578.html', cpev.value) - 50), 
                LENGTH('sofas/size/pluffy-arm-1018578.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/pluffy-armless-1018599.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/pluffy-armless-1018599.html', cpev.value) - 50), 
                LENGTH('sofas/size/pluffy-armless-1018599.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/pluffy-chaise-1018585.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/pluffy-chaise-1018585.html', cpev.value) - 50), 
                LENGTH('sofas/size/pluffy-chaise-1018585.html') + 100)
        WHEN cpev.value LIKE '%sofas/size/pluffy-chaise-1018592.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sofas/size/pluffy-chaise-1018592.html', cpev.value) - 50), 
                LENGTH('sofas/size/pluffy-chaise-1018592.html') + 100)
        WHEN cpev.value LIKE '%sydney-140-ceramic-diningtable.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sydney-140-ceramic-diningtable.html', cpev.value) - 50), 
                LENGTH('sydney-140-ceramic-diningtable.html') + 100)
        WHEN cpev.value LIKE '%sydney-159-ceramic-diningtable.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sydney-159-ceramic-diningtable.html', cpev.value) - 50), 
                LENGTH('sydney-159-ceramic-diningtable.html') + 100)
        WHEN cpev.value LIKE '%sydney-159-tanceramic-diningtable.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sydney-159-tanceramic-diningtable.html', cpev.value) - 50), 
                LENGTH('sydney-159-tanceramic-diningtable.html') + 100)
        WHEN cpev.value LIKE '%sydney-140-tanceramic-diningtable.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sydney-140-tanceramic-diningtable.html', cpev.value) - 50), 
                LENGTH('sydney-140-tanceramic-diningtable.html') + 100)
        WHEN cpev.value LIKE '%sydney-180-ceramic-diningtable.html%' THEN 
            SUBSTRING(cpev.value, 
                GREATEST(1, LOCATE('sydney-180-ceramic-diningtable.html', cpev.value) - 50), 
                LENGTH('sydney-180-ceramic-diningtable.html') + 100)
        ELSE SUBSTRING(cpev.value, 1, 200) -- 如果沒有匹配特定的 URL 模式，則提取前 200 個字符
    END AS url_context
FROM 
    catalog_product_entity_text cpev
JOIN 
    catalog_product_entity cpe ON cpev.entity_id = cpe.entity_id
JOIN 
    eav_attribute ea ON cpev.attribute_id = ea.attribute_id
WHERE 
    ea.attribute_code IN ('description', 'short_description')
    AND (
        cpev.value LIKE '%pluffy-chaise-1018585.html%'
        OR cpev.value LIKE '%pluffy-ottoman-1018606.html%'
        OR cpev.value LIKE '%pluffy-chaise-1018592.html%'
        OR cpev.value LIKE '%pluffy-ottoman-1018613.html%'
        OR cpev.value LIKE '%modular-sofa-pluffy-5451.html%'
        OR cpev.value LIKE '%modular-sofa-pluffy-5454.html%'
        OR cpev.value LIKE '%modular-sofa-pluffy-5457.html%'
        OR cpev.value LIKE '%modular-sofa-pluffy-5460.html%'
        OR cpev.value LIKE '%modular-sofa-pluffy-5463.html%'
        OR cpev.value LIKE '%modular-sofa-pluffy-5466.html%'
        OR cpev.value LIKE '%modular-sofa-pluffy-5469.html%'
        OR cpev.value LIKE '%pluffy-arm-1018564.html%'
        OR cpev.value LIKE '%pluffy-arm-1018557.html%'
        OR cpev.value LIKE '%pluffy-arm-1018571.html%'
        OR cpev.value LIKE '%pluffy-arm-1018578.html%'
        OR cpev.value LIKE '%pluffy-armless-1018599.html%'
        OR cpev.value LIKE '%electric-leather-sofa-1018278.html%'
        OR cpev.value LIKE '%electric-leather-sofa-1018279.html%'
        OR cpev.value LIKE '%electric-leather-sofa-1018281.html%'
        OR cpev.value LIKE '%electric-leather-sofa-1018282.html%'
        OR cpev.value LIKE '%electric-leather-sofa-1018284.html%'
        OR cpev.value LIKE '%electric-leather-sofa-1018285.html%'
        OR cpev.value LIKE '%electric-leather-sofa-1018287.html%'
        OR cpev.value LIKE '%electric-leather-sofa-1018288.html%'
        OR cpev.value LIKE '%gl-sheets-b-single.html%'
        OR cpev.value LIKE '%gl-sheets-dg-queen.html%'
        OR cpev.value LIKE '%gl-sheets-dg-single.html%'
        OR cpev.value LIKE '%gl-sheets-g-queen.html%'
        OR cpev.value LIKE '%gl-sheets-g-single.html%'
        OR cpev.value LIKE '%gl-sheets-p-single.html%'
        OR cpev.value LIKE '%gl-sheets-w-single.html%'
        OR cpev.value LIKE '%gl-sheets-p-queen.html%'
        OR cpev.value LIKE '%gl-sheets-w-queen.html%'
        OR cpev.value LIKE '%hermes.html%'
        OR cpev.value LIKE '%homedecor-1018102.html%'
        OR cpev.value LIKE '%homedecor-1018115.html%'
        OR cpev.value LIKE '%homedecor-1018111.html%'
        OR cpev.value LIKE '%homedecor-1018130.html%'
        OR cpev.value LIKE '%homedecor-1018128.html%'
        OR cpev.value LIKE '%homedecor-1018127.html%'
        OR cpev.value LIKE '%homedecor-1018134.html%'
        OR cpev.value LIKE '%homedecor-1018136.html%'
        OR cpev.value LIKE '%homedecor-1018144.html%'
        OR cpev.value LIKE '%homedecor-1018145.html%'
        OR cpev.value LIKE '%homedecor-1018152.html%'
        OR cpev.value LIKE '%homedecor-1018156.html%'
        OR cpev.value LIKE '%homedecor-1018157.html%'
        OR cpev.value LIKE '%homedecor-1018153.html%'
        OR cpev.value LIKE '%homedecor-1018158.html%'
        OR cpev.value LIKE '%homedecor-1018159.html%'
        OR cpev.value LIKE '%homedecor-1018160.html%'
        OR cpev.value LIKE '%homedecor-1018167.html%'
        OR cpev.value LIKE '%homedecor-1018172.html%'
        OR cpev.value LIKE '%homedecor-1018166.html%'
        OR cpev.value LIKE '%homedecor-1018170.html%'
        OR cpev.value LIKE '%homedecor-1018173.html%'
        OR cpev.value LIKE '%homedecor-1018174.html%'
        OR cpev.value LIKE '%homedecor-1018179.html%'
        OR cpev.value LIKE '%homedecor-1018175.html%'
        OR cpev.value LIKE '%homedecor-1018181.html%'
        OR cpev.value LIKE '%homedecor-1018184.html%'
        OR cpev.value LIKE '%homedecor-1018183.html%'
        OR cpev.value LIKE '%homedecor-1018182.html%'
        OR cpev.value LIKE '%homedecor-1018185.html%'
        OR cpev.value LIKE '%homedecor-1018189.html%'
        OR cpev.value LIKE '%homedecor-1018191.html%'
        OR cpev.value LIKE '%homedecor-1018190.html%'
        OR cpev.value LIKE '%homedecor-1018194.html%'
        OR cpev.value LIKE '%homedecor-1018196.html%'
        OR cpev.value LIKE '%homedecor-1018198.html%'
        OR cpev.value LIKE '%homedecor-1018206.html%'
        OR cpev.value LIKE '%homedecor-1018208.html%'
        OR cpev.value LIKE '%homedecor-1018209.html%'
        OR cpev.value LIKE '%loungechair-1018223.html%'
        OR cpev.value LIKE '%loungechair-1018224.html%'
        OR cpev.value LIKE '%loungechair-1018225.html%'
        OR cpev.value LIKE '%loungechair-1018227.html%'
        OR cpev.value LIKE '%loungechair-1018226.html%'
        OR cpev.value LIKE '%loungechair-1018228.html%'
        OR cpev.value LIKE '%modular-sofa-dune-5707.html%'
        OR cpev.value LIKE '%modular-sofa-dune-5708.html%'
        OR cpev.value LIKE '%sofas-nordic-rufus-rhf-light-grey.html%'
        OR cpev.value LIKE '%sofas/pluffy-arm-1018557.html%'
        OR cpev.value LIKE '%sofas/pluffy-arm-1018564.html%'
        OR cpev.value LIKE '%sofas/pluffy-arm-1018571.html%'
        OR cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018557.html%'
        OR cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018564.html%'
        OR cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018571.html%'
        OR cpev.value LIKE '%sofas/size/modular-seating/pluffy-arm-1018578.html%'
        OR cpev.value LIKE '%sofas/size/modular-seating/pluffy-armless-1018599.html%'
        OR cpev.value LIKE '%sofas/size/modular-seating/pluffy-chaise-1018585.html%'
        OR cpev.value LIKE '%sofas/size/modular-seating/pluffy-chaise-1018592.html%'
        OR cpev.value LIKE '%sofas/size/pluffy-arm-1018557.html%'
        OR cpev.value LIKE '%sofas/size/pluffy-arm-1018564.html%'
        OR cpev.value LIKE '%sofas/size/pluffy-arm-1018571.html%'
        OR cpev.value LIKE '%sofas/size/pluffy-arm-1018578.html%'
        OR cpev.value LIKE '%sofas/size/pluffy-armless-1018599.html%'
        OR cpev.value LIKE '%sofas/size/pluffy-chaise-1018585.html%'
        OR cpev.value LIKE '%sofas/size/pluffy-chaise-1018592.html%'
        OR cpev.value LIKE '%sydney-140-ceramic-diningtable.html%'
        OR cpev.value LIKE '%sydney-159-ceramic-diningtable.html%'
        OR cpev.value LIKE '%sydney-159-tanceramic-diningtable.html%'
        OR cpev.value LIKE '%sydney-140-tanceramic-diningtable.html%'
        OR cpev.value LIKE '%sydney-180-ceramic-diningtable.html%'
    )

ORDER BY 
    location_type, 
    matched_url;