import json

with open("data_modified.json", "r") as file:
    data = json.load(file)

districts = {}

for entry in data:
    district_name = entry["District_Name"]
    season = entry["Season"]
    crop = entry["Crop"]

    if district_name not in districts:
        districts[district_name] = {}

    if season not in districts[district_name]:
        districts[district_name][season] = []

    districts[district_name][season].append(crop)

print(districts)

with open("updated_list.json", "w") as file:
    json.dump(districts, file, indent=4)
