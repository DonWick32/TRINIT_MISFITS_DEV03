import 'package:all_things_green/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechniquesController extends GetxController {
       final api = Get.find<ApiServices>().api;
   final data = {}.obs;
   void fetchTechniques() async {
    print("HI");
    api.getTechniques().then((value) {
      print("HI1");
      print(value);
      data.value = value;
      update();
    }, onError: (err) {
      print(err);
    });
   }
}