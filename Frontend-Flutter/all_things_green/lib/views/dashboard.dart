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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text("Get Optimum Crop List"),
                onPressed: controller.getCrops,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => Text("Your District: ${controller.district.value}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.data.value.length,
                  itemBuilder: (context, index) {
                    String key = controller.data.value.keys.elementAt(index);
                    List<String> values = controller.data.value[key];
                    return ExpansionTile(
                      title: Text(key),
                      children: values.map((crop) => Text(crop)).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

