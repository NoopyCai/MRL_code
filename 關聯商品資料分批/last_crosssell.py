import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_last_crosssell.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
    "1018187","1018188","1018200","1018201","1018207","1018192","1018195","1018197","1018199","1018202","1018203","1018204","1018205","1018186"
]

addons_template = [
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018192",
      "linked_product_type": "simple",
      "position": 1
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018187",
      "linked_product_type": "simple",
      "position": 2
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018193",
      "linked_product_type": "simple",
      "position": 3
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018186",
      "linked_product_type": "simple",
      "position": 4
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018188",
      "linked_product_type": "simple",
      "position": 5
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018201",
      "linked_product_type": "simple",
      "position": 6
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018207",
      "linked_product_type": "simple",
      "position": 7
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018197",
      "linked_product_type": "simple",
      "position": 8
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018202",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018204",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018200",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018195",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018199",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018141",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018140",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "1018187",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018139",
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