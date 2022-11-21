import 'package:bary_solutions/pages/epidemiological_vigilance/epidemiological_vigilance_register/epidemiological_vigilance_register_controller.dart';
import 'package:bary_solutions/pages/epidemiological_vigilance/epidemiological_vigilance_register/epidemiological_vigilance_register_page.dart';
import 'package:bary_solutions/pages/epidemiological_vigilance/epidemiological_vigilance_view/epidemiological_vigilance_page.dart';
import 'package:bary_solutions/pages/epidemiological_vigilance/epidemiological_vigilance_view/epidemiological_vigilance_page_controller.dart';
import 'package:bary_solutions/pages/home/home_page.dart';
import 'package:bary_solutions/pages/login/login_controller.dart';
import 'package:bary_solutions/pages/login/login_page.dart';
import 'package:bary_solutions/services/auth_service.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.INITIAL,
        page: () => LoginPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
          Get.lazyPut<AuthService>(() => AuthService(), fenix: true);
        })),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.EPIDEMIOLOGICAL_VIGILANCE_REGISTER,
      page: () => EpidemiologialVigilanceRegisterPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<EpidemiologicalVigilanceRegisterController>(() => EpidemiologicalVigilanceRegisterController(), fenix: true);
      }),
    ),
    GetPage(
        name: Routes.EPIDEMIOLOGICAL_VIGILANCE,
        page: () => EpidemiologicalVigilancePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<EpidemiologicalVigilancePageController>(() => EpidemiologicalVigilancePageController(), fenix: true);
        })),
  ];
}
