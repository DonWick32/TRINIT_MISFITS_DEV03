// ignore_for_file: prefer_const_constructors

import 'package:all_things_green/constants/navigation_routes.dart';
import 'package:flutter/material.dart';
import 'package:all_things_green/controllers/landing_controller.dart';
import 'package:get/get.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Landing'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome to All Things Green!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 80, 200, 100)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pick an option below",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(20.0)),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 200,
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 42, 170, 138)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      controller.setUserType('Farmer');
                      Get.toNamed(NavigationRoutes.login, arguments: 'Farmer');
                    },
                    child: const Text(
                      'Farmer',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 200,
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 87, 51)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      controller.setUserType('Enthusiast');
                      Get.toNamed(NavigationRoutes.login,
                          arguments: 'Enthusiast');
                    },
                    child: const Text(
                      'Enthusiast',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 200,
                  height: 70,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 93, 63, 211)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      controller.setUserType('Expert');
                      Get.toNamed(NavigationRoutes.login, arguments: 'Expert');
                    },
                    child: const Text(
                      'Expert',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
