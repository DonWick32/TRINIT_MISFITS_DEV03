import json

with open("crop_location_database.json", "r") as file:
    data = json.load(file)

for item in data:
    del item["Area"]
    del item["Production"]
    del item["Crop_Year"]

with open("data_modified.json", "w") as file:
    json.dump(data, file, indent=4)

district_names = set()

for entry in data:
    district_names.add(entry["District_Name"])

#districts for our data set
print(list(district_names))
#number of districts
print(len(list(district_names)))