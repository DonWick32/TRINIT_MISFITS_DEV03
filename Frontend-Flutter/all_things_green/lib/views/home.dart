// ignore_for_file: prefer_const_constructors

import 'package:all_things_green/constants/navigation_routes.dart';
import 'package:all_things_green/views/chat.dart';
import 'package:all_things_green/views/dashboard.dart';
import 'package:all_things_green/views/login.dart';
import 'package:all_things_green/views/plant.dart';
import 'package:all_things_green/views/query.dart';
import 'package:all_things_green/views/query.dart';
import 'package:all_things_green/views/schemes.dart';
import 'package:all_things_green/views/techniques.dart';
import 'package:flutter/material.dart';
import 'package:all_things_green/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final userType = Get.arguments.toString();

    return GetBuilder<HomeController>(builder: ((controller){
      return Scaffold(
      appBar: AppBar(
        title: Text('Home - $userType'),
      ),
      body: IndexedStack(
        index: controller.selectedIndex.value,
        children: [
          DashboardPage(),
          ChatPage(),
          userType == 'Enthusiast' ? PlantPage() : LoginPage(),
          QueryPage(),
          TechniquesPage(),
          userType == 'Farmer' ? SchemesPage() : LoginPage(),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        userType == 'Enthusiast' ? BottomNavigationBarItem(
          icon: Icon(Icons.nature),
          label: 'Plant',
        ) : BottomNavigationBarItem(
          icon: Icon(Icons.login),
          label: 'Login',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.query_builder),
          label: 'Query',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.science),
          label: 'Techniques',
        ),
        userType == 'Farmer' ? BottomNavigationBarItem(
          icon: Icon(Icons.table_chart_outlined),
          label: 'Schemes',
        ) : BottomNavigationBarItem(
          icon: Icon(Icons.login),
          label: 'Login',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.business),
        //   label: 'Business',
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.school),
        //   label: 'School',
        // ),
      ],
      currentIndex: controller.selectedIndex.value,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.black,
      onTap: controller.onItemTapped,
      showSelectedLabels: false,
      // showUnselectedLabels: false,
    ),
    );
    }));
  }
}
