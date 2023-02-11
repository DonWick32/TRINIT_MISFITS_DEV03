// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:all_things_green/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: ElevatedButton(child: Text("Get District"), onPressed: () => {
          controller.district()
        },)
      ),
    );
  }
}
