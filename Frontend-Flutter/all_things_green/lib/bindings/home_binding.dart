
import 'package:all_things_green/controllers/chat_controller.dart';
import 'package:all_things_green/controllers/dashboard_controller.dart';
import 'package:all_things_green/controllers/home_controller.dart';
import 'package:all_things_green/controllers/plant_controller.dart';
import 'package:all_things_green/controllers/query_controller.dart';
import 'package:all_things_green/controllers/schemes_controller.dart';
import 'package:all_things_green/controllers/techniques_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => PlantController());
    Get.lazyPut(() => QueryController());
    Get.lazyPut(() => SchemesController());
    Get.lazyPut(() => TechniquesController());
    Get.lazyPut(() => ChatController());
  }
}