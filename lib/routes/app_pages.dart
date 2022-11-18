import 'package:bary_solutions/pages/epidemiologial_vigilance_register/epidemiological_vigilance_register_page.dart';
import 'package:bary_solutions/pages/home/home_page.dart';
import 'package:bary_solutions/pages/login/login_binding.dart';
import 'package:bary_solutions/pages/login/login_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.EPIDEMIOLOGICAL_VIGILANCE_REGISTER,
      page: () => EpidemiologialVigilanceRegisterPage(),
    ),
  ];
}
