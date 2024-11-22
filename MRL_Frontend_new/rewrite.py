import json

path = '/Users/mrl/Downloads/test_collection.json'
sku = "23-0104-1-19"

try:
    with open(path, 'r', encoding='utf-8') as file:
        data = file.read()
        json_obj = json.loads(data)

        json_obj["item"][0]["item"][2]["name"] = sku
        json_obj["item"][0]["item"][2]["request"]["url"]["raw"] = f'{{{{adminUri}}}}/index.php/rest/V1/products/{sku}/links'
        json_obj["item"][0]["item"][2]["request"]["url"]["path"][4] = sku
        json_obj["item"][0]["item"][2]["request"]["body"]["raw"] = json.dumps({
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
                    "position": 1
                }
            ]
        })

    with open(path, 'w', encoding='utf-8') as file:
        json.dump(json_obj, file, ensure_ascii=False, indent=4)

except Exception as e:
    print(e)