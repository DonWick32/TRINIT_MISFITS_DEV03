import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  void onItemTapped(int index) {
    selectedIndex.value = index;
    print(selectedIndex.value);
    update();
  }
}