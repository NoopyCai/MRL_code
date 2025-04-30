import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_winter_quilt_part5_2.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
    "1017785-v2", "1017786-v2", "1017787-v2", "1017802-v2", "1017803-v2", "1017804-v2", "1017817-v2", "1017818-v2", "1017969", "1018043", "1018264", "1018265", "1018378", "1018381", "1018382", "1018409", "1018410", "1018411", "1018418", "1018419", "11-0001-115327-01", "11-0008-104006-01", "11-0042-219067-03", "11-0046-203001-03", "11-0046-216056-03", "11-0060-227060-03-v2", "11-0060-227070-03-v2", "11-0060-227071-03-v2"
]
addons_template = [
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-113015-01",
      "linked_product_type": "simple",
      "position": 21
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-113045-01",
      "linked_product_type": "simple",
      "position": 22
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-100016-01",
      "linked_product_type": "simple",
      "position": 23
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0013-100025-01",
      "linked_product_type": "simple",
      "position": 24
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1017775-v2",
      "linked_product_type": "simple",
      "position": 25
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0012-0-08-v2",
      "linked_product_type": "simple",
      "position": 26
    },
{
      "sku": "1017785-v2",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0041-0-08-v2",
      "linked_product_type": "simple",
      "position": 27
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