import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/epidemiologial_vigilance_register/epidemiological_vigilance_register_page.dart';
// import 'pages/home/home_page.dart';
// import 'pages/login/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      home: EpidemiologialVigilanceRegisterPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFEF7F1A),
          fontFamily: 'Nunito',
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFFEF7F1A))),
    ),
  );
}
