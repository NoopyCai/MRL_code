import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_winter_quilt_config.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
"GL-2210-014", "GL-2210-011", "GL-2210-010", "GL-2210-009", "GL-2210-008", "GL-2210-007", "GL-2210-006", "GL-2210-005", "GL-2210-004", "GL-2210-003", "GL-2210-002", "GL-2210-001"
]
addons_template = [
 {
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00115",
      "linked_product_type": "configurable",
      "position": 1
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0042-0-08-v2",
      "linked_product_type": "configurable",
      "position": 2
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0003-0-08-v2",
      "linked_product_type": "configurable",
      "position": 3
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0033-0-08-v2",
      "linked_product_type": "configurable",
      "position": 4
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018407",
      "linked_product_type": "configurable",
      "position": 5
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00108",
      "linked_product_type": "configurable",
      "position": 6
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00116",
      "linked_product_type": "configurable",
      "position": 7
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00117",
      "linked_product_type": "configurable",
      "position": 8
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00114",
      "linked_product_type": "configurable",
      "position": 9
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018052",
      "linked_product_type": "configurable",
      "position": 10
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00109",
      "linked_product_type": "configurable",
      "position": 11
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018053",
      "linked_product_type": "configurable",
      "position": 12
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00106",
      "linked_product_type": "configurable",
      "position": 13
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018054",
      "linked_product_type": "configurable",
      "position": 14
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00110",
      "linked_product_type": "configurable",
      "position": 15
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00107",
      "linked_product_type": "configurable",
      "position": 16
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-100016-01",
      "linked_product_type": "configurable",
      "position": 17
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-100025-01",
      "linked_product_type": "configurable",
      "position": 18
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-113015-01",
      "linked_product_type": "configurable",
      "position": 19
    },
{
      "sku": "1018698",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-113045-01",
      "linked_product_type": "configurable",
      "position": 20
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