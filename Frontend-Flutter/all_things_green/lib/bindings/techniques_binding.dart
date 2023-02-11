
import 'package:all_things_green/controllers/techniques_controller.dart';
import 'package:get/get.dart';

class TechniquesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TechniquesController());
  }
}