
import 'package:flutter/material.dart';
import 'package:all_things_green/bindings/landing_binding.dart';
import 'package:all_things_green/views/landing.dart';
import 'package:all_things_green/config/navigation_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All Things Green',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: LandingBinding(),
      home: const LandingPage(),
      getPages: NavigationPages.pages,
    );
  }
}