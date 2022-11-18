import 'package:bary_solutions/pages/home/home_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../pages/login/login_page.dart';
import '../services/auth_service.dart';

class CheckAuthWidget extends StatelessWidget {
  const CheckAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AuthService.to.userIsAuthenticated.value ? HomePage() : LoginPage());
  }
}
