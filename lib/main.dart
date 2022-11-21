import 'package:flutter/material.dart';

import 'package:bary_solutions/config/global.theme.dart';
import 'package:bary_solutions/widgets/check_auth_widget.dart';
import 'package:bary_solutions/config/config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() async {
  await initConfiguration();

  runApp(
    GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      home: CheckAuthWidget(),
      navigatorKey: Get.key,
      getPages: AppPages.routes,
    ),
  );
}
