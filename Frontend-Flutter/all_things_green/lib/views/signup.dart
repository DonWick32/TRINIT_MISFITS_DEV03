// ignore_for_file: prefer_const_constructors

import 'package:all_things_green/constants/navigation_routes.dart';
import 'package:all_things_green/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    final userType = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup $userType'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.nameController,
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
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.passwordController,
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
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: DropdownButtonFormField(
                //     decoration: const InputDecoration(
                //       labelText: 'Select a language',
                //     ),
                //     value: controller.selectedLanguage.value,
                //     items: controller.languages.map((language) {
                //       return DropdownMenuItem(
                //         value: language,
                //         child: Text(language),
                //       );
                //     }).toList(),
                //     onChanged: (value) {
                //       controller.selectedLanguage.value = value!;
                //     },
                //     validator: (value) {
                //       if (value!.isEmpty) {
                //         return 'Please select at least one language';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
               GFMultiSelect(
    items: controller.languages,
    onSelect: (value) {
      controller.updateLanguages(value);
    },
    dropdownTitleTileText: 'Choose language(s)',
    dropdownTitleTileColor: Colors.grey[200],
    dropdownTitleTileMargin: EdgeInsets.only(
        top: 22, left: 18, right: 18, bottom: 5),
    dropdownTitleTilePadding: EdgeInsets.all(10),
    dropdownUnderlineBorder: const BorderSide(
        color: Colors.transparent, width: 2),
    // dropdownTitleTileBorder:
    // Border.all(
    //   // color: Colors.grey[300], 
    //   width: 1),
    dropdownTitleTileBorderRadius: BorderRadius.circular(5),
    expandedIcon: const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    ),
    collapsedIcon: const Icon(
      Icons.keyboard_arrow_up,
      color: Colors.black54,
    ),
    submitButton: Text('OK'),
    dropdownTitleTileTextStyle: const TextStyle(
        fontSize: 14, color: Colors.black54),
    // padding: const EdgeInsets.all(8),
    // margin: const EdgeInsets.all(6),
    type: GFCheckboxType.basic,
    activeBgColor: Colors.green.withOpacity(0.5),
    // inactiveBorderColor: Colors.grey[200],
  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
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
                      controller.signup(userType);
                      // Get.toNamed(NavigationRoutes.home, arguments: userType);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
              ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
