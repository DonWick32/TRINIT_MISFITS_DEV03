import 'package:all_things_green/services/api_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
    final api = Get.find<ApiServices>().api;
    final data = {}.obs;
    final district = "".obs;
  void getCrops() async{
    data.value = {};
    district.value = "";
    update();
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
    }else if(permission == LocationPermission.deniedForever){
        print("'Location permissions are permanently denied");
    }else{
        print("GPS Location service is granted");
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
print(position.longitude); //Output: 80.24599079
print(position.latitude); //Output: 29.6593457

  final lng = position.longitude;
  final lat = position.latitude;
  api.getDistrict(lat, lng).then((value) {
      // api.getOldDistrict(value).then((value) {
      //   print(value);
      // }, onError: (err) {
      //   print(err);
      // });
      district.value = value;
      update();
      api.getCrops(value).then((value) {
        data.value = value;
        print(value);
      }, onError: (err) {
        print(err);
      });
      // print(value);
    }, onError: (err) {
      print(err);
    });
    }
    
  }
}