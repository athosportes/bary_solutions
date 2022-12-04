// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class EpidemiologicalVigilanceModel {
  num? admissoes;
  num? cvc;
  DateTime? data;
  DateTime? dataRegistro;
  String? estabelecimentoId;
  num? npp;
  num? pacientes;
  num? svd;
  num? vm;

  EpidemiologicalVigilanceModel(
      {this.admissoes,
      this.cvc,
      this.data,
      this.dataRegistro,
      this.estabelecimentoId,
      this.npp,
      this.pacientes,
      this.svd,
      this.vm,
      });

  EpidemiologicalVigilanceModel.fromJson(Map<String, dynamic> json) {
    Timestamp dataTimestamp = json['data'];
    var dataConvert = dataTimestamp.millisecondsSinceEpoch;

    Timestamp dataRegistroTimestamp = json['dataRegistro'];
    var dataRegistroConvert = dataRegistroTimestamp.millisecondsSinceEpoch;

    admissoes = json['admissoes'];
    cvc = json['cvc'];
    data = DateTime.fromMillisecondsSinceEpoch(dataConvert);
    dataRegistro = DateTime.fromMillisecondsSinceEpoch(dataRegistroConvert);
    estabelecimentoId = json['estabelecimentoId'];
    npp = json['npp'];
    pacientes = json['pacientes'];
    svd = json['svd'];
    vm = json['vm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admissoes'] = this.admissoes;
    data['cvc'] = this.cvc;
    data['data'] = this.data;
    data['dataRegistro'] = this.dataRegistro;
    data['estabelecimentoId'] = this.estabelecimentoId;
    data['npp'] = this.npp;
    data['pacientes'] = this.pacientes;
    data['svd'] = this.svd;
    data['vm'] = this.vm;
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'admissoes': admissoes,
      'cvc': cvc,
      'data': data,
      'dataRegistro': dataRegistro,
      'estabelecimentoId': estabelecimentoId,
      'npp': npp,
      'pacientes': pacientes,
      'svd': svd,
      'vm': vm,
    };
  }

}
