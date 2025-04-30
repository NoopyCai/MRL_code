<?php
$__sku = '10-0094-000021-04';
$path = '/Users/dio/Downloads/MRL.postman_collection.json';
$jsonString = file_get_contents($path);
$jsonObj = json_decode($jsonString, true);
$jsonObj['item'][0]['item'][2]['name'] = $__sku;
$jsonObj['item'][0]['item'][2]['request']['url']['raw'] = sprintf('"{{adminUri}}/index.php/rest/V1/products/%s/links"', $__sku);
$jsonObj['item'][0]['item'][2]['request']['url']['path'][4] = $__sku;
$jsonObj['item'][0]['item'][2]['request']['body']['raw'] = 
'{"items":[
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0003-0-08",
      "linked_product_type": "simple",
      "position": 1
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0042-0-08",
      "linked_product_type": "simple",
      "position": 2
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0033-0-08",
      "linked_product_type": "simple",
      "position": 3
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0017-0-23",
      "linked_product_type": "simple",
      "position": 4
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0018-0-23",
      "linked_product_type": "simple",
      "position": 5
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0016-0-23",
      "linked_product_type": "simple",
      "position": 6
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0024-0-23",
      "linked_product_type": "simple",
      "position": 7
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0019-0-23",
      "linked_product_type": "simple",
      "position": 8
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018052",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018053",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018054",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0030-0-26",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0031-0-26",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0029-0-26",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1017816",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-113015-01",
      "linked_product_type": "simple",
      "position": 16
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-113045-01",
      "linked_product_type": "simple",
      "position": 17
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-100016-01",
      "linked_product_type": "simple",
      "position": 18
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-100025-01",
      "linked_product_type": "simple",
      "position": 19
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-113015-01",
      "linked_product_type": "simple",
      "position": 20
    }]}';

$skus = [
    '10-0095-000021-04','10-0030-100232-01','10-0031-115327-01','10-0034-113039-01','10-0035-113039-01','10-0045-113039-01','10-0048-104006-01','10-0053-103010-01','10-0054-103010-01','10-0101-216056-03','10-0122-219067-03','11-0001-115327-01','11-0008-104006-01','11-0042-219067-03','11-0046-216056-03','10-0106-216056-03','10-0105-216056-03','10-0031-115276-01','11-0001-115276-01','10-0028-100232-01','11-0061-113069-01','10-0379-0-26','10-0378-0-26','10-0381-0-26','10-0380-0-26','10-0396-0-26','10-0395-0-26','10-0398-0-26','10-0399-0-26','10-0401-0-26','10-0402-0-26','10-0404-0-26','10-0405-0-26','1017788','1017790','1017792','1017796','1017793','1017797','1017789','1017791','1017794','1017798','1017795','1017799','10-0376-0-26-v2','10-0394-0-26-v2','10-0400-0-26-v2','10-0377-0-26-v2','10-0397-0-26-v2','10-0403-0-26-v2','1017785','1017786','1017787','1017802','1017803','1017804','10-0264-216056-03','1017806','1017807','1017808','1017809','1017810','1017811','1017812','1017813','1017814','1017815','1017817','1017818','1017825','1017831','1017832','1017833','1017898','1017899','1017900','1017901','1017902','1017903','1017904','1017905','1017908','1017906','1017907','1017909','1018019','1018020','1018071','1018073','1018085','10-0101-203001-03','10-0105-203001-03','10-0106-203001-03','10-0115-203001-03','10-0264-203001-03','11-0046-203001-03','10-0350-203001-03-v2','10-0375-0-26','10-0374-0-26','10-0373-0-26','1017969','1018032','1018033','1018038','1018039','1018040','1018041','1018042','1018043','1018044','1018045','1018046','1018047','1018048','1018049'
];
$key = 3;
for($i=0; $i<count($skus); $i++)
{
    $jsonObj['item'][0]['item'][$key] = $jsonObj['item'][0]['item'][2];
    $jsonObj['item'][0]['item'][$key]['request']['body']['raw'] = str_replace('"'.$__sku.'"', '"'.$skus[$i].'"', $jsonObj['item'][0]['item'][$key]['request']['body']['raw']);
    $jsonObj['item'][0]['item'][$key]['name'] = $skus[$i];
    $jsonObj['item'][0]['item'][$key]['request']['url']['raw'] = sprintf('"{{adminUri}}/index.php/rest/V1/products/%s/links"', $skus[$i]);
    $jsonObj['item'][0]['item'][$key]['request']['url']['path'][4] = $skus[$i];
    $key++;
}

$path = '/Users/dio/Downloads/MRL.postman_collection_sofa1.json';
$jsonString = json_encode($jsonObj, JSON_PRETTY_PRINT);
// Write in the file
$fp = fopen($path, 'w');
fwrite($fp, $jsonString);
fclose($fp);
