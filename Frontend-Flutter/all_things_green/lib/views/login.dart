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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.phoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    filled: true,
                    labelText: 'Phone Number',
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
                keyboardType: TextInputType.phone,
              ),
            ),
            // TextField(
            //   keyboardType: TextInputType.phone,
            //   decoration: InputDecoration(
            //     hintText: 'Enter phone number',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            SizedBox(
              height: .0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      filled: true,
                      labelText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      fillColor: Colors.white70),
                      
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
                width: 150,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all<Color>(
                    //     Color.fromARGB(255, 93, 63, 211)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.login();
                    Get.toNamed(NavigationRoutes.home, arguments: userType);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
SizedBox(
              height: 16.0,
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Get.toNamed(NavigationRoutes.signup, arguments: userType);
            //     },
            //     child: Text('Sign Up'),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
  onTap: () {
    Get.toNamed(NavigationRoutes.signup, arguments: userType);
  },
  child: Text('Sign Up', style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 34, 0, 255),),), 
),
            ),
          ],
        ),
      ),
    );
  }
}
