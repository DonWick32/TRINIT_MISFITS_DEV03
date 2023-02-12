import 'dart:convert';

import 'package:all_things_green/constants/app_constants.dart';
import 'package:all_things_green/services/storage_services.dart';
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
Future<Map<String, List<String>>> getCrops(String district) async {
  try {
    final response = await http.get(
        Uri.parse(AppConstants.postCropsUrl + district));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      var data = <String, List<String>>{};
      for (var key in json.keys) {
        List<String> cropsList = List<String>.from(json[key]);
        cropsList = cropsList.toSet().toList(); // Filter out duplicates
        data[key.trim()] = cropsList;
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

Future<String> signup(Map<String, String> signupRequest, String userType, StorageServices storageServices) async {
  try {
    final response = await http.post(
        Uri.parse(AppConstants.postSignupUrl + userType.toLowerCase()),
        body: jsonEncode(signupRequest),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      await storageServices.storeUser(json['user_id']);
      return json['message'];
    } else {
      return 'User creation failed';
    }
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}

Future<String> postQuery(String query) async {
  try {
    final storage = Get.find<StorageServices>();
    final userID = storage.getUser();
    final userType = storage.getUserType();
    final response = await http.post(
        Uri.parse(AppConstants.postQueryUrl + userType!.toLowerCase() + "?sender_id=" + userID!.toString() + "&query_string=" + query),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['message'];
    } else {
      return 'Query creation failed';
    }
  } catch (e) {
    print(e);
    return Future.error(e);
  }
}
Future<List<Map<String, dynamic>>> getQueries() async {
  try {
    final response = await http.get(Uri.parse(AppConstants.getQueryUrl));
    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;
      final data = jsonList.map((json) => json as Map<String, dynamic>).toList();
      return data;
    } else {
      return [];
    }
  } catch (e) {
    print(e);
    throw e;
  }
}


}
