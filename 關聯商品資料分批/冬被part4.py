import json
import copy

__sku = "10-0094-000021-04"
path = "/Users/mrl/Desktop/MRL.postman_winter_quilt_part4.json"

with open(path, "r") as file:
    jsonObj = json.load(file)

skus = [
 "10-0031-115327-01", "10-0034-113039-01", "10-0048-104006-01", "10-0054-103010-01", "10-0101-216056-03-v2", "10-0105-216056-03-v2", "10-0106-216056-03-v2", "10-0122-219067-03", "10-0264-216056-03-v2", "1018380", "1018383", "1018416", "1018417", "1018420", "1018421", "1018424", "1018425", "1018426", "1018483", "10-0101-203001-03-v2", "10-0105-203001-03-v2", "10-0106-203001-03-v2", "10-0115-203001-03", "10-0264-203001-03-v2", "10-0350-203001-03-v2", "10-0373-0-26-v2", "10-0374-0-26-v2", "10-0375-0-26-v2", "1018032", "1018039", "1018042", "1018044", "1018045", "1018046", "1018047", "1018217", "1018219", "1018221", "1018222", "1018236", "1018256", "1018258", "1018270", "1018272", "1018277", "1018280", "1018283", "1018286", "1018289", "1018377", "1018379", "1018413", "1018414", "1018415", "1018422", "1018423"
]
addons_template = [
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00115",
      "linked_product_type": "simple",
      "position": 1
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0042-0-08-v2",
      "linked_product_type": "simple",
      "position": 2
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0003-0-08-v2",
      "linked_product_type": "simple",
      "position": 3
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-30-0033-0-08-v2",
      "linked_product_type": "simple",
      "position": 4
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018407",
      "linked_product_type": "simple",
      "position": 5
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00108",
      "linked_product_type": "simple",
      "position": 6
    },
{
      "sku": "",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00116",
      "linked_product_type": "simple",
      "position": 7
    },
{
      "sku": "",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00117",
      "linked_product_type": "simple",
      "position": 8
    },
{
      "sku": "",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00114",
      "linked_product_type": "simple",
      "position": 9
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018052",
      "linked_product_type": "simple",
      "position": 10
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00109",
      "linked_product_type": "simple",
      "position": 11
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018053",
      "linked_product_type": "simple",
      "position": 12
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00106",
      "linked_product_type": "simple",
      "position": 13
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1018054",
      "linked_product_type": "simple",
      "position": 14
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00110",
      "linked_product_type": "simple",
      "position": 15
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-23-00107",
      "linked_product_type": "simple",
      "position": 16
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0031-0-26",
      "linked_product_type": "simple",
      "position": 17
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-1017816",
      "linked_product_type": "simple",
      "position": 18
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0029-0-26",
      "linked_product_type": "simple",
      "position": 19
    },
{
      "sku": "10-0031-115327-01",
      "link_type": "crosssell",
      "linked_product_sku": "Addon-CS-33-0030-0-26",
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