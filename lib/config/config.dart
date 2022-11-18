import 'package:bary_solutions/pages/login/login_controller.dart';
import 'package:bary_solutions/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../firebase_options.dart';

initConfiguration() async {
  WidgetsFlutterBinding.ensureInitialized();

  //default locale
  Intl.defaultLocale = 'pt_BR';

  //firebase initializer
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  //new instafe of AuthService by getx
  Get.lazyPut<AuthService>(() => AuthService());
  Get.lazyPut<LoginController>(() => LoginController());

  //disable horizontal rotation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

}
