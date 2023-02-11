import 'package:all_things_green/constants/navigation_routes.dart';
import 'package:all_things_green/services/api_services.dart';
import 'package:all_things_green/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final selectedState = 'Andhra Pradesh'.obs;
  final selectedLanguages = [].obs;
  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];
  final List<String> languages = [
  'English',
  'Hindi',
  'Bengali',
  'Telugu',
  'Marathi',
  'Tamil',
  'Gujarati',
  'Urdu',
  'Kannada',
  'Oriya',
  'Punjabi',
  'Malayalam',
  'Assamese',
  'Rajasthani',
  'Bihari',
  'Haryanvi',
  'Kashmiri',
  'Sindhi',
  'Nepali',
  'Ladakhi',
  'Sanskrit',
  'Manipuri',
  'Maithili'
];

  void login() async {
    final mobile = phoneController.text;
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
  void updateLanguages(List<dynamic> valueList) {
    selectedLanguages.clear();
    for (int i = 0; i < valueList.length; i++) {
        selectedLanguages.add(languages[valueList[i]]);
    }
    print(selectedLanguages);
  }
  void signup(String userType) async {
  Map<String, String> signupRequest = {
    "name": nameController.text,
    "phone_number": phoneController.text,
    "email": emailController.text,
    "region": selectedState.value,
    "language": selectedLanguages[0],
    "password": passwordController.text
  };

  try {
    final String response = await api.signup(signupRequest, userType, storage);
    print(response);
    Get.snackbar('Success', response);
    if (response == "User created successfully"){
      Get.toNamed(NavigationRoutes.home, arguments: userType);
    }
    print(storage.getUser());
  } catch (e) {
    Get.snackbar('Failure', e.toString());
  }
}
}
