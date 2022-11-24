import 'package:bary_solutions/models/unit_model.dart';
import 'package:bary_solutions/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EpidemiologicalVigilancePageController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _authService = Get.find<AuthService>();

  var date = TextEditingController().obs;

  void setDate(date) => this.date = date;

  Future<void> loadEpidemiologicalVigilanceList() async {
    final userId = _authService.user.uid;
    await firestore
        .collection('UNIDADE')
        // .where('estabelecimentoId' == )
        .get()
        .then((value) => print(value));
  }
}
