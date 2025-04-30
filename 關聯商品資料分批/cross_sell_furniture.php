<?php
$__sku = '23-0104-1-19';
$path = '/Users/dio/Downloads/MRL.postman_collection.json';
$jsonString = file_get_contents($path);
$jsonObj = json_decode($jsonString, true);
$jsonObj['item'][0]['item'][2]['name'] = $__sku;
$jsonObj['item'][0]['item'][2]['request']['url']['raw'] = sprintf('"{{adminUri}}/index.php/rest/V1/products/%s/links"', $__sku);
$jsonObj['item'][0]['item'][2]['request']['url']['path'][4] = $__sku;
$jsonObj['item'][0]['item'][2]['request']['body']['raw'] = '{"items":[
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
      "linked_product_sku": "Addon-CS-30-0034-0-23",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0035-0-23",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0036-0-23",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018052",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018053",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018054",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0029-0-26",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0030-0-26",
      "linked_product_type": "simple",
      "position": 16
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0031-0-26",
      "linked_product_type": "simple",
      "position": 17
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1017816",
      "linked_product_type": "simple",
      "position": 18
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-113015-01",
      "linked_product_type": "simple",
      "position": 19
    },
{
      "sku": "' . $__sku . '",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-113045-01",
      "linked_product_type": "simple",
      "position": 20
    }
]}';

$skus = [
    '23-0103-1-19','23-0063-1-19-v2','23-0024-1-02','23-0047-1-19','23-0048-1-19','23-0059-1-19','23-0060-1-19','23-0066-1-19','23-0067-1-19','23-0071-1-25','23-0072-1-25','23-0073-1-25','23-0074-1-25','23-0075-1-25','23-0076-1-25','23-0079-1-19','23-0080-1-19','23-0087-1-25','23-0097-1-19','23-0085-1-25','23-0088-1-25','23-0098-1-19','23-0108-1-19','23-0107-1-19','23-0028-1-19-v2','23-0109-1-19','23-0110-1-19','1017750','1017983','1017995','1017994','1017993','1017992','1017984','20-0116-0-06','22-0009-0-06','22-0047-0-19','22-0048-0-19','22-0049-0-19','22-0050-0-19','22-0051-0-19','22-0052-0-19','22-0054-0-19','22-0055-0-19','22-0070-0-19','22-0071-0-18','22-0073-0-06','22-0074-0-06','22-0075-0-06','22-0077-0-18','22-0078-0-02','22-0079-0-19','22-0082-0-19','22-0086-0-19','22-0087-0-19','22-0090-0-19','22-0132-0-19','22-0135-0-19','22-0110-0-19','31-0054-0-19','22-0138-0-19','22-0119-0-19','22-0139-0-19','22-0140-0-19','22-0143-0-19','22-0142-0-19','22-0008-0-06-v2','20-0035-0-06-v2','22-0021-1-06-v2','1017929','1017928','1017927','1017965','22-0141-0-19','22-0144-0-19','22-0145-0-19','1017935','1017968','1017970','1017985','1017986','1018009','1017998','12-0007-0-02','12-0008-113069-01','12-0017-0-02','12-0018-0-02','12-0021-0-17','12-0022-0-17','12-0023-0-17','12-0024-0-17','12-0025-0-17','12-0028-0-17','12-0029-0-17','12-0030-0-17','12-0031-0-17','12-0032-0-17','12-0033-0-17','12-0034-0-17','12-0035-0-17','12-0036-0-17','12-0037-0-17','12-0038-0-18','12-0039-0-18','12-0043-0-09','12-0044-0-09','12-0047-0-09','12-0049-0-19','12-0057-0-17','12-0058-0-17','12-0059-0-19','12-0070-100122-01','12-0071-0-17','12-0072-0-17','12-0078-0-12-v2','12-0079-0-12-v2','12-0081-0-12-v2','13-0001-0-02','13-0003-0-02','13-0012-0-02','13-0013-0-02','13-0016-0-19','13-0017-0-19','13-0018-0-18','13-0019-0-19','13-0021-0-19','13-0023-0-19','13-0025-0-19','13-0029-0-19','14-0007-0-17','14-0008-0-17','14-0009-0-17','14-0010-0-17','14-0013-0-17','14-0014-0-17','14-0018-0-17','14-0019-0-17','14-0020-0-17','35-0005-0-17','35-0007-0-17','35-0016-0-17','12-0082-0-02','12-0083-0-02','12-0084-0-02','13-0028-0-19','12-0086-0-17','12-0080-0-12-v2','13-0034-0-19','13-0035-0-19','12-0085-0-17','1017974','1017975','1017976','1017981','1017982','1017980','1017979','1017978','1017977','1018003','1017972','1018050','1018051','1018100','20-0008-0-02','20-0041-0-02','20-0042-0-02','20-0070-0-19','20-0082-0-24','20-0084-0-24','20-0089-0-24','20-0096-0-02','20-0097-0-02','20-0101-0-19','20-0102-0-06','20-0103-0-06','20-0106-0-24','20-0109-0-19','20-0110-0-19','20-0134-0-19','20-0127-0-02','20-0133-0-19','20-0040-0-06-v2','20-0014-0-06-v2','20-0034-0-06-v2','20-0132-0-19','1017934','1017967','1018011','1018010','21-0005-0-02','21-0021-0-19','21-0022-0-19','21-0031-0-19','21-0034-0-19','21-0060-0-19','21-0044-0-19','21-0052-0-19','21-0050-0-02','21-0057-0-19','21-0004-1-06-v2','21-0003-0-06-v2','21-0056-0-19','24-0020-0-02','24-0023-0-18','24-0024-0-18','24-0031-0-19','24-0034-0-19','24-0035-0-18','24-0036-0-18','24-0037-0-19','24-0039-0-19','24-0040-0-19','24-0042-0-19','24-0046-0-06','24-0076-0-02','24-0077-0-19','1017805','24-0006-0-06-v2','1017924','1017921','1017922','1017925','1017931','1017940','1017941','1017933-v2','1017973','32-0001-1001-16','32-0005-1004-16','32-0007-1009-16','32-0008-1002-16','32-0011-1001-16','32-0012-1001-16','32-0013-1001-16','32-0014-1001-16','32-0017-5002-16','32-0019-1001-16','32-0020-1001-16','32-0020-1004-16','32-0022-1001-16'
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

$path = '/Users/dio/Downloads/MRL.postman_collection_furniture1.json';
$jsonString = json_encode($jsonObj, JSON_PRETTY_PRINT);
// Write in the file
$fp = fopen($path, 'w');
fwrite($fp, $jsonString);
fclose($fp);
