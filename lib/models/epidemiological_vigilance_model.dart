// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EpidemiologicalVigilanceModel {
  num admissoes;
  num cvc;
  DateTime data;
  DateTime dataRegistro;
  String estabelecimentoId;
  num npp;
  num pacientes;
  num svd;
  num vm;

  EpidemiologicalVigilanceModel({
    required this.admissoes,
    required this.cvc,
    required this.data,
    required this.dataRegistro,
    required this.estabelecimentoId,
    required this.npp,
    required this.pacientes,
    required this.svd,
    required this.vm,
  });

  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'admissoes': admissoes,
      'cvc': cvc,
      'data': data.toUtc(),
      'dataRegistro': dataRegistro.toUtc(),
      'estabelecimentoId': estabelecimentoId,
      'npp': npp,
      'pacientes': pacientes,
      'svd': svd,
      'vm': vm,
    };
  }

  factory EpidemiologicalVigilanceModel.fromMap(Map<String, dynamic> map) {
    return EpidemiologicalVigilanceModel(
      admissoes: map['admissoes'] as num,
      cvc: map['cvc'] as num,
      data: DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      dataRegistro: DateTime.fromMillisecondsSinceEpoch(map['dataRegistro'] as int),
      estabelecimentoId: map['estabelecimentoId'] as String,
      npp: map['npp'] as num,
      pacientes: map['pacientes'] as num,
      svd: map['svd'] as num,
      vm: map['vm'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory EpidemiologicalVigilanceModel.fromJson(String source) => EpidemiologicalVigilanceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
