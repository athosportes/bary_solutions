import 'package:bary_solutions/pages/login/login_controller.dart';
import 'package:bary_solutions/services/auth_service.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthService>(() => AuthService());
  }
}