// ignore_for_file: invalid_return_type_for_catch_error

import 'package:flutter/material.dart';

import 'package:bary_solutions/models/epidemiological_vigilance_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';

import '../../../constants/constants.dart' as color;

class EpidemiologicalVigilanceRegisterController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final patientsController = TextEditingController().obs;
  final admissionsController = TextEditingController().obs;
  final svdController = TextEditingController().obs;
  final cvcController = TextEditingController().obs;
  final vmController = TextEditingController().obs;
  final nppController = TextEditingController().obs;

  var date = DateTime.now().obs;

  setDate(date) => this.date.value = date;

  @override
  onInit() {
    super.onInit();
    const INITIAL_VALUE = '0';

    patientsController.value.text = INITIAL_VALUE;
    admissionsController.value.text = INITIAL_VALUE;
    svdController.value.text = INITIAL_VALUE;
    cvcController.value.text = INITIAL_VALUE;
    vmController.value.text = INITIAL_VALUE;
    nppController.value.text = INITIAL_VALUE;
  }

  Future<void> handleAddEpidemiologicalVigilance() async {
    Get.dialog(
        Center(child: CircularProgressIndicator(color: color.primaryColor)));

    final epidemiologicalVigilanceModel = EpidemiologicalVigilanceModel(
        pacientes: toInt(patientsController.value.text),
        cvc: toInt(cvcController.value.text),
        data: date.value,
        dataRegistro: DateTime.now(),
        estabelecimentoId: '1324adsfadsfasg',
        npp: toInt(nppController.value.text),
        svd: toInt(svdController.value.text),
        vm: toInt(vmController.value.text),
        admissoes: toInt(admissionsController.value.text));

    await firestore
        .collection("FICHA_VIGILANCIA")
        .add(epidemiologicalVigilanceModel.toMap())
        .then((resp) {})
        .catchError((error) => Get.snackbar(
            'Erro', 'Não foi possível salvar o registro, tente novamente',
            backgroundColor: color.error, colorText: Colors.white))
        .whenComplete(() {
      Get.back();
      Get.back();
      Get.snackbar(
        'Sucesso',
        'Registro salvo com sucesso',
        backgroundColor: color.primaryColor,
        colorText: Colors.white,
      );
    });

  }
}
