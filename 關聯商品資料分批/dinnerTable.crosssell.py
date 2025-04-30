import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_dinnerTable_crosssell.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
    "1017940", "24-0066-0-06", "24-0006-0-06-v2", "1017941", "24-0040-0-19", "24-0046-0-06", "1018320", "24-0035-0-18", "1017922", "1018328", "24-0031-0-19", "24-0036-0-18", "24-0077-0-19", "1017989", "1017948", "24-0034-0-19", "1017924", "1017933-v2", "1017805", "24-0020-0-02", "1017931", "24-0023-0-18", "24-0024-0-18", "24-0076-0-02", "1017925", "1017973", "1018406"]

addons_template = [
 {
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018140",
      "linked_product_type": "simple",
      "position": 1
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0042-0-08-v2",
      "linked_product_type": "simple",
      "position": 2
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018121",
      "linked_product_type": "simple",
      "position": 3
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0003-0-08-v2",
      "linked_product_type": "simple",
      "position": 4
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018139",
      "linked_product_type": "simple",
      "position": 5
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0033-0-08-v2",
      "linked_product_type": "simple",
      "position": 6
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018123",
      "linked_product_type": "simple",
      "position": 7
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018407",
      "linked_product_type": "simple",
      "position": 8
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018141",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018125",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018119",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018168",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018169",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1017775-v2",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0012-0-08-v2",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "1017940",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0041-0-08-v2",
      "linked_product_type": "simple",
      "position": 16
}
]

# Ensure there are at least 3 items in the list
if len(jsonObj["item"][0]["item"]) < 3:
    print("Error: Not enough items in the JSON object to copy.")
    exit(1)

key = 3
for sku in skus:
    # Create a deep copy of the addons template and update the SKU
    addons = [dict(addon, sku=sku) for addon in addons_template]
    
    # Append a new item to the JSON object
    new_item = copy.deepcopy(jsonObj["item"][0]["item"][2])
    new_item["request"]["body"]["raw"] = json.dumps({"items": addons}, indent=4)
    new_item["name"] = sku
    new_item["request"]["url"]["raw"] = f"{{{{adminUri}}}}/index.php/rest/V1/products/{sku}/links"
    new_item["request"]["url"]["path"][4] = sku
    jsonObj["item"][0]["item"].append(new_item)
    key += 1

with open(path, "w") as file:
    json.dump(jsonObj, file, indent=4)