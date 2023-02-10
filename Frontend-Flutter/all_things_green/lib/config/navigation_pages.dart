import 'package:all_things_green/bindings/login_binding.dart';
import 'package:all_things_green/bindings/signup_binding.dart';
import 'package:all_things_green/bindings/landing_binding.dart';
import 'package:all_things_green/views/login.dart';
import 'package:all_things_green/views/signup.dart';
import 'package:all_things_green/views/landing.dart';
import 'package:get/get.dart';
import 'package:all_things_green/constants/navigation_routes.dart';

class NavigationPages {
  static final List<GetPage> pages = [
    GetPage(
      name: NavigationRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      arguments: String,
    ),
    GetPage(
      name: NavigationRoutes.signup,
      page: () => const SignupPage(),
      binding: SignupBinding(),
      arguments: String,
    ),
    GetPage(
      name: NavigationRoutes.landing,
      page: () => const LandingPage(),
      binding: LandingBinding(),
    ),
  ];
}