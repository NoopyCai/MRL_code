import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_winter_quilt_part3.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
 "10-0376-0-26-v3", "10-0377-0-26-v3", "10-0378-0-26-v2", "10-0379-0-26", "10-0380-0-26", "10-0381-0-26-v2", "10-0394-0-26-v3", "10-0395-0-26-v2", "10-0396-0-26-v2", "10-0397-0-26-v3", "10-0398-0-26-v2", "10-0399-0-26-v2", "10-0400-0-26-v3", "10-0401-0-26-v2", "10-0402-0-26", "10-0403-0-26-v3", "10-0404-0-26-v2", "10-0405-0-26-v2", "1017788-v2", "1017789-v2", "1017790-v2", "1017791-v2", "1017792-v2", "1017793-v2", "1017794-v2", "1017795-v2", "1017796-v2", "1017797-v2", "1017798", "1017799-v2", "1017806-v2", "1017807-v2", "1017808-v2", "1017809-v2", "1017810-v2", "1017811-v2", "1017812-v2", "1017813-v2", "1017814-v2", "1017815-v2", "1017825-v2", "1017831-v2", "1017832-v2", "1017833-v2", "1017898-v2", "1017899-v2", "1017900-v2", "1017901-v2", "1017902-v2", "1017903-v2", "1017904-v2", "1017905-v2", "1017906-v2", "1017907-v2", "1017908-v2", "1017909-v2", "1018019-v2", "1018020-v2", "1018071-v2", "1018073-v2", "1018081-v2", "1018082-v2", "1018083-v2", "1018084-v2", "1018085-v2", "1018086-v2", "1018087-v2", "1018088-v2", "1018089-v2", "1018090-v2", "1018091-v2", "1018092-v2", "1018093-v2", "1018094-v2", "1018095-v2", "1018096-v2", "1018343-v2", "1018357-v2", "1018360-v2", "1018393-v2", "1018394-v2", "1018395-v2", "1018396-v2", "1018397-v2", "1018398-v2", "1018399-v2", "1018400-v2", "1018401-v2", "10-0379-0-26-v2", "10-0380-0-26-v2", "10-0402-0-26-v2", "1017798-v2"
]
addons_template = [
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00115",
      "linked_product_type": "simple",
      "position": 1
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0042-0-08-v2",
      "linked_product_type": "simple",
      "position": 2
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0003-0-08-v2",
      "linked_product_type": "simple",
      "position": 3
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0033-0-08-v2",
      "linked_product_type": "simple",
      "position": 4
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018407",
      "linked_product_type": "simple",
      "position": 5
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00108",
      "linked_product_type": "simple",
      "position": 6
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00116",
      "linked_product_type": "simple",
      "position": 7
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00117",
      "linked_product_type": "simple",
      "position": 8
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00114",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0031-0-26",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00109",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1017816",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00106",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0029-0-26",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0030-0-26",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00110",
      "linked_product_type": "simple",
      "position": 16
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00107",
      "linked_product_type": "simple",
      "position": 17
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018052",
      "linked_product_type": "simple",
      "position": 18
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018053",
      "linked_product_type": "simple",
      "position": 19
    },
{
      "sku": "10-0376-0-26-v3",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018054",
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