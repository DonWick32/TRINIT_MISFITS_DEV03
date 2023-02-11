import 'package:all_things_green/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PlantController extends GetxController {
  void buyNow (String url) async {
    await launchUrlString(url);
  }
  void setNotification(int hours, int minutes) async {
    print(hours);
scheduleNotification(hours, minutes)
    .then((value) {
        Get.snackbar("Notification", "Daily notification reminder set for $hours:$minutes");
    })
    .catchError((error) {
        print(error.toString());
    });
  }
}