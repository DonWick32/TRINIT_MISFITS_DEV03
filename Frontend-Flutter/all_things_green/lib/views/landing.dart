// ignore_for_file: prefer_const_constructors

import 'package:all_things_green/constants/navigation_routes.dart';
import 'package:flutter/material.dart';
import 'package:all_things_green/controllers/landing_controller.dart';
import 'package:get/get.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Landing'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome to All Things Green!", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              Text("Pick an option below", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              Padding(padding: const EdgeInsets.all(20.0)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(NavigationRoutes.login, arguments: 'farmer');
                  },
                  child: const Text('Farmer', style: TextStyle(fontSize: 15),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(NavigationRoutes.login, arguments: 'enthusiast');
                  },
                  child: const Text('Enthusiast', style: TextStyle(fontSize: 15),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(NavigationRoutes.login, arguments: 'expert');
                  },
                  child: const Text('Expert', style: TextStyle(fontSize: 15),),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
