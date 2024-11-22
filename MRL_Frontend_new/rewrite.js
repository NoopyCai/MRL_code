const fs = require('fs');
const path = '/Users/mrl/Downloads/test_collection.json';
const sku = "23-0104-1-19";

fs.readFile(path, 'utf8', (err, data) => {
    if (err) {
        console.error(err);
        return;
    }
    let jsonObj = JSON.parse(data);

    jsonObj["item"][0]["item"][2]["name"] = sku;
    jsonObj["item"][0]["item"][2]["request"]["url"]["raw"] = `{{adminUri}}/index.php/rest/V1/products/${sku}/links`;
    jsonObj["item"][0]["item"][2]["request"]["url"]["path"][4] = sku;
    jsonObj["item"][0]["item"][2]["request"]["body"]["raw"] = JSON.stringify({
        "items": [
            {
                "sku": "1018139",
                "link_type": "upsell",
                "linked_product_sku": "1018144",
                "linked_product_type": "simple",
                "position": 1
            },
            {
                "sku": "1018139",
                "link_type": "upsell",
                "linked_product_sku": "1018140",
                "linked_product_type": "simple",
                "position": 2
            }
        ]
    });

    const jsonString = JSON.stringify(jsonObj, null, 2);
    fs.writeFile(path, jsonString, 'utf8', (err) => {
        if (err) {
            console.error(err);
            return;
        }
        console.log('File has been updated');
    });
});