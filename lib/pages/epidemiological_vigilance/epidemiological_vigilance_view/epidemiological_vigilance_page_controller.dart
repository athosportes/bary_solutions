import 'package:bary_solutions/models/unit_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EpidemiologicalVigilancePageController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var date = TextEditingController().obs;

  void setDate(date) => this.date = date;

  Future<void> loadEpidemiologicalVigilanceList() async {
    final units = firestore.collection('UNIDADE').withConverter<UnitModel>(fromFirestore: (snapshot, _) => UnitModel.fromJson(snapshot.data()!), toFirestore: (unit, _) => unit.toJson());

    }
}
