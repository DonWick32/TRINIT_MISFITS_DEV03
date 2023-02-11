import 'dart:convert';

import 'package:all_things_green/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServices extends GetxService {
  late ApiManager api;

  Future<ApiServices> initApi() async {
    api = ApiManager();
    return this;
  }
}

class ApiManager extends GetConnect {
  Future<String> getDistrict(double lat, double lng) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.opencagedata.com/geocode/v1/json?key=${AppConstants.openCageAPIKey}&q=$lat+$lng'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final district = json['results'][0]['components']
            ['county']; // get the district name from the API response
        print('District: $district');
        return district;
      } else {
        return 'Failed to get district';
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String> getOldDistrict(String currentDistrict) async {
    try {
      String dataPortalUrl =
          "https://api.data.gov.in/resource/cd5e209a-f8d7-4449-bbe9-d2a2af2500d4?api-key=${AppConstants.dataGovAPIKey}&format=json&filters[districtname2010]=$currentDistrict";
      final response = await http.get(Uri.parse(dataPortalUrl));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json["records"].length > 0) {
          String district2010 = json["records"][0]["districtname2010"];
          return district2010;
        } else {
          return "No matching 2010 district found.";
        }
      } else {
        print(response.body);
        return 'Failed to get district';
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Map<String, String>> getSchemes() async {
  try {
    final response = await http.get(Uri.parse(
        AppConstants.getSchemesUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      var data = <String, String>{};
      for (var i = 0; i < json.length; i++) {
        print(json[i]["Description"]);
        data[json[i]["Name"]] = json[i]["Description"];
      }
      return data;
    } else {
      return {};
    }
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}
Future<Map<String, String>> getTechniques() async {
  try {
    final response = await http.get(Uri.parse(
        AppConstants.getTechniquesUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      var data = <String, String>{};
      for (var i = 0; i < json.length; i++) {
        print(json[i]["Description"]);
        data[json[i]["Name"]] = json[i]["Description"];
      }
      return data;
    } else {
      return {};
    }
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}

}
