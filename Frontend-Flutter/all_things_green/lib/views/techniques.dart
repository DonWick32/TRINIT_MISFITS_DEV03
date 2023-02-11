// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:all_things_green/controllers/techniques_controller.dart';
import 'package:get/get.dart';

class TechniquesPage extends GetView<TechniquesController> {
const TechniquesPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
controller.fetchTechniques();
return Obx(() {
  final data = controller.data.value;

  return Expanded(
    child: Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final key = data.keys.elementAt(index);
              final value = data[key];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      key,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ),
  );
});
}
}