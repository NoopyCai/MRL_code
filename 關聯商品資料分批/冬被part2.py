import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_winter_quilt_part2.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
"30-0027-0-08-v2","30-0011-0-08-v2","30-0010-0-08-v2","30-0009-0-08-v2","30-0008-0-08-v2","1017829-v2","1017828-v2","1017827-v2","1017826","1017830"
]
addons_template = [
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00115",
      "linked_product_type": "simple",
      "position": 1
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0042-0-08-v2",
      "linked_product_type": "simple",
      "position": 2
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0003-0-08-v2",
      "linked_product_type": "simple",
      "position": 3
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0033-0-08-v2",
      "linked_product_type": "simple",
      "position": 4
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018407",
      "linked_product_type": "simple",
      "position": 5
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00116",
      "linked_product_type": "simple",
      "position": 6
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00117",
      "linked_product_type": "simple",
      "position": 7
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00114",
      "linked_product_type": "simple",
      "position": 8
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00108",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00107",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00109",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00110",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00106",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1017775-v2",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0012-0-08-v2",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "30-0027-0-08-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0041-0-08-v2",
      "linked_product_type": "simple",
      "position": 16
    },
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