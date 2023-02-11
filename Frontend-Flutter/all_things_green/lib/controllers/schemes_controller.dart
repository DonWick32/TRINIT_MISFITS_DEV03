import 'package:all_things_green/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchemesController extends GetxController {
   final api = Get.find<ApiServices>().api;
   final data = {}.obs;
   void fetchSchemes() async {
    print("HI");
    api.getSchemes().then((value) {
      print("HI1");
      print(value);
      data.value = value;
      update();
    }, onError: (err) {
      print(err);
    });
   }
}