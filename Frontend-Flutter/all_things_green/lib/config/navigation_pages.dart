import 'package:all_things_green/bindings/login_binding.dart';
import 'package:all_things_green/bindings/home_binding.dart';
import 'package:all_things_green/bindings/dashboard_binding.dart';
import 'package:all_things_green/bindings/signup_binding.dart';
import 'package:all_things_green/bindings/landing_binding.dart';
import 'package:all_things_green/bindings/chat_binding.dart';
import 'package:all_things_green/bindings/plant_binding.dart';
import 'package:all_things_green/bindings/query_binding.dart';
import 'package:all_things_green/bindings/techniques_binding.dart';
import 'package:all_things_green/bindings/schemes_binding.dart';
import 'package:all_things_green/views/login.dart';
import 'package:all_things_green/views/home.dart';
import 'package:all_things_green/views/dashboard.dart';
import 'package:all_things_green/views/query.dart';
import 'package:all_things_green/views/signup.dart';
import 'package:all_things_green/views/chat.dart';
import 'package:all_things_green/views/landing.dart';
import 'package:all_things_green/views/plant.dart';
import 'package:all_things_green/views/schemes.dart';
import 'package:all_things_green/views/techniques.dart';
import 'package:all_things_green/views/video_call_screen.dart';
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
    GetPage(
      name: NavigationRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      arguments: String,
    ),
    GetPage(
      name: NavigationRoutes.chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
      arguments: String,
    ),
    GetPage(
      name: NavigationRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
      arguments: String,
    ),
    GetPage(
      name: NavigationRoutes.plant,
      page: () => const PlantPage(),
      binding: PlantBinding(),
    ),
    GetPage(
      name: NavigationRoutes.query,
      page: () => const QueryPage(),
      binding: QueryBinding(),
      arguments: String,
    ),
    GetPage(
      name: NavigationRoutes.schemes,
      page: () => const SchemesPage(),
      binding: SchemesBinding(),
    ),
    GetPage(
      name: NavigationRoutes.techniques,
      page: () => const TechniquesPage(),
      binding: TechniquesBinding(),
    ),
    GetPage(
      name: NavigationRoutes.video,
      page: () => const VideoCallScreen(),
    ),
  ];
}