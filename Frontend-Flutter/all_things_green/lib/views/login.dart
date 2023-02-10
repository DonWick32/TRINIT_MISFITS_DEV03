// ignore_for_file: prefer_const_constructors

import 'package:all_things_green/constants/navigation_routes.dart';
import 'package:flutter/material.dart';
import 'package:all_things_green/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final userType = Get.arguments.toString();
    return Scaffold(
        appBar: AppBar(
          title: Text('Login $userType'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // add logic for logging in here
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(NavigationRoutes.signup, arguments: userType);
                  },
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
