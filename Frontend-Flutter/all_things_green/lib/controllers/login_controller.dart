import 'package:all_things_green/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginController extends GetxController {
    final api = Get.find<ApiServices>().api;

  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final mobile = mobileController.text;
    final password = passwordController.text;
    if (mobile.isEmpty || password.isEmpty) {
      Get.snackbar('Invalid Credentials', 'Unable To Login');
      return;
    }
    // api
    //     .loginCutomer(
    //         LoginRequest(email: userName, password: password), storage)
    //     .then((response) {
    //   isLoading.value = false;
    //   navigateToHome();
    // }, onError: (err) {
    //   isLoading.value = false;
    //   Get.snackbar('Failed To Login', err.toString());
    // });
  }
}