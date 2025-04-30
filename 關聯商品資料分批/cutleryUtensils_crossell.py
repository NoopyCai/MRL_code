import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_collection_crosssell.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
    "1018139", "1018140", "1018141", "1018107", "1018108", "1018109", "1018120", "1018121", "1018122", "1018123", "1018124", "1018125", "1018171", "1018119", "1018116", "1018117", "1018154", "1018113", "1018114", "1018169", "1018103", "1018118", "1018106", "1018110", "1018155", "1018168", "1018144", "1018161", "1018162", "1018163", "1018164", "1018165", "1018210", "1018211"
]

addons_template = [
 {
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018140",
      "linked_product_type": "simple",
      "position": 1
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018141",
      "linked_product_type": "simple",
      "position": 2
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018121",
      "linked_product_type": "simple",
      "position": 3
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018125",
      "linked_product_type": "simple",
      "position": 4
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018161",
      "linked_product_type": "simple",
      "position": 5
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018123",
      "linked_product_type": "simple",
      "position": 6
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018119",
      "linked_product_type": "simple",
      "position": 7
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018171",
      "linked_product_type": "simple",
      "position": 8
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018114",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018103",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018110",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018163",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018169",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018139",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018165",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "1018139",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018162",
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