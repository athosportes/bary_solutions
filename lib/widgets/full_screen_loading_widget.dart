import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart' as colors;

class FullScreenLoadingWidget {

  Future<dynamic> build(BuildContext context) {
    return Get.dialog(
        Center(child: CircularProgressIndicator(color: colors.primaryColor)));
  }
}
