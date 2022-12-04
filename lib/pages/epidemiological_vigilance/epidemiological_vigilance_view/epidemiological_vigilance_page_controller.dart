import 'package:flutter/material.dart';

import 'package:bary_solutions/models/epidemiological_vigilance_model.dart';
import 'package:bary_solutions/services/auth_service.dart';
import 'package:bary_solutions/models/unit_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class EpidemiologicalVigilancePageController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _authService = Get.find<AuthService>();
  RxBool loadingUnitList = false.obs;
  RxBool loadingEpidemiologicalList = false.obs;

  RxList<UnitModel> unitList = RxList<UnitModel>();
  RxList<EpidemiologicalVigilanceModel> epidemiologicalList =
      RxList<EpidemiologicalVigilanceModel>();

  var date = TextEditingController().obs;
  void setDate(date) => this.date = date;

  Future<void> loadUnits() async {
    loadingUnitList.value = true;
    final establishmentId =
        _authService.userInformations.value!.estabelecimento;
    var snapshot = await firestore
        .collection('UNIDADE')
        .where('estabelecimentoId', isEqualTo: establishmentId)
        .get()
        .whenComplete(() {
      loadingUnitList.value = false;
    });

    List<UnitModel> _unitModels = snapshot.docs.map((e) => UnitModel.fromJson(e.data())).toList();
    unitList.value = _unitModels;
  }

  Future<void> loadEpidemiologicalVigilanceList() async {
    loadingEpidemiologicalList.value = true;
    final establishmentId =
        _authService.userInformations.value!.estabelecimento;
    var snapshot = await firestore
        .collection('FICHA_VIGILANCIA')
        .where('estabelecimentoId', isEqualTo: establishmentId)
        .get()
        .whenComplete(() {
      loadingEpidemiologicalList.value = false;
    });

    List<EpidemiologicalVigilanceModel> _epidemiologicalModels = snapshot.docs
        .map((e) => EpidemiologicalVigilanceModel.fromJson(e.data()))
        .toList();

    epidemiologicalList.value = _epidemiologicalModels;
  }

  getDate(context, dateTime) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());

    if (newDate == null) return;
    setDate(newDate);
  }
}
