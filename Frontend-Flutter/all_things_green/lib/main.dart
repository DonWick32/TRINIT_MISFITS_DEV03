
import 'package:all_things_green/constants/app_constants.dart';
import 'package:all_things_green/constants/navigation_routes.dart';
import 'package:all_things_green/controllers/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:all_things_green/bindings/landing_binding.dart';
import 'package:all_things_green/views/landing.dart';
import 'package:all_things_green/config/navigation_pages.dart';
import 'package:get/get.dart';
import 'services/api_services.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  Get.put(LandingController());
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => ApiServices().initApi());
//   String appID = AppConstants.chatAppID; // Replace with your App ID
//   String region = AppConstants.region; // Replace with your App Region ("eu" or "us")

//  AppSettings appSettings = (AppSettingsBuilder()
//         ..subscriptionType = CometChatSubscriptionType.allUsers
//         ..region= region
//         ..autoEstablishSocketConnection =  true
//     ).build();

//     CometChat.init(appID, appSettings, onSuccess: (String successMessage) {
//       debugPrint("Initialization completed successfully  $successMessage");
//     }, onError: (CometChatException e) {
//       debugPrint("Initialization failed with exception: ${e.message}");
//     });
}

class MyApp extends GetView<LandingController> {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'All Things Green',
      theme: ThemeData(primarySwatch: Colors.blue),
      // initialBinding: LandingBinding(),
      // home: const LandingPage(),
      initialRoute: NavigationRoutes.landing,
      getPages: NavigationPages.pages,
    );
  }
}