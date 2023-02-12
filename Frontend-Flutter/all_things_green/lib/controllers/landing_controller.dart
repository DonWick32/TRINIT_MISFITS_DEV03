import 'package:all_things_green/services/api_services.dart';
import 'package:all_things_green/services/storage_services.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final storage = Get.find<StorageServices>();
  void setUserType (String type) async {
    await storage.storeUserType(type);
  }
}