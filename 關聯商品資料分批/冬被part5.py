import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_winter_quilt_part5.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
  "1017785-v2", "1017786-v2", "1017787-v2", "1017802-v2", "1017803-v2", "1017804-v2", "1017817-v2", "1017818-v2", "1017969", "1018043", "1018264", "1018265", "1018378", "1018381", "1018382", "1018409", "1018410", "1018411", "1018418", "1018419", "11-0001-115327-01", "11-0008-104006-01", "11-0042-219067-03", "11-0046-203001-03", "11-0046-216056-03", "11-0060-227060-03-v2", "11-0060-227070-03-v2", "11-0060-227071-03-v2"
]
addons_template = [
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00115",
      "linked_product_type": "simple",
      "position": 1
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0042-0-08-v2",
      "linked_product_type": "simple",
      "position": 2
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0003-0-08-v2",
      "linked_product_type": "simple",
      "position": 3
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0033-0-08-v2",
      "linked_product_type": "simple",
      "position": 4
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018407",
      "linked_product_type": "simple",
      "position": 5
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00108",
      "linked_product_type": "simple",
      "position": 6
    },
{
      "sku": "1017785-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00116",
      "linked_product_type": "simple",
      "position": 7
    },
{
      "sku": "1017785-v4",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00117",
      "linked_product_type": "simple",
      "position": 8
    },
{
      "sku": "1017785-v5",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00114",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018052",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00109",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018053",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00106",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018054",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00110",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00107",
      "linked_product_type": "simple",
      "position": 16
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-113015-01",
      "linked_product_type": "simple",
      "position": 17
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-113045-01",
      "linked_product_type": "simple",
      "position": 18
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-100016-01",
      "linked_product_type": "simple",
      "position": 19
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0014-100025-01",
      "linked_product_type": "simple",
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