// ignore_for_file: prefer_const_constructors

import 'package:all_things_green/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    final userType = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup $userType'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Use this method to save the value entered by the user
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Use this method to save the value entered by the user
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email ID',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Use this method to save the value entered by the user
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  // Use this method to save the value entered by the user
                },
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Select 3 Languages',
                ),
                value: controller.selectedLanguage.value,
                items: controller.languages.map((language) {
                  return DropdownMenuItem(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.selectedLanguage.value = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select at least one language';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'State',
                ),
                value: controller.selectedState.value,
                items: controller.states.map((state) {
                  return DropdownMenuItem(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.selectedState.value = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select a state';
                  }
                  return null;
                },
              ),
              // DropdownButtonFormField(
              //   decoration: const InputDecoration(
              //     labelText: 'City',
              //   ),
              //   value: controller.selectedCity,
              //   items: controller.cities.map((city) {
              //     return DropdownMenuItem(
              //       value: city,
              //       child: Text(city),
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     controller.selectedCity = value;
              //   },
              //   validator: (value) {
              //     if (value.isEmpty) {
              //       return 'Please select a city';
              //     }
              //     return null;
              //   },
              // ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // if (controller.validate()) {
                    //   // Use this method to save all the values entered by the user
                    // }
                  },
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
