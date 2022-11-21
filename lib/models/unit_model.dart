// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UnitModel {
  DateTime dataRegistro;
  String descricao;
  String estabelecimentoId;
  num numeroLeitos;
  String tipoSetor;

  UnitModel({
    required this.dataRegistro,
    required this.descricao,
    required this.estabelecimentoId,
    required this.numeroLeitos,
    required this.tipoSetor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataRegistro': dataRegistro.millisecondsSinceEpoch,
      'descricao': descricao,
      'estabelecimentoId': estabelecimentoId,
      'numeroLeitos': numeroLeitos,
      'tipoSetor': tipoSetor,
    };
  }

  factory UnitModel.fromMap(Map<String, dynamic> map) {
    return UnitModel(
      dataRegistro:
          DateTime.fromMillisecondsSinceEpoch(map['dataRegistro'] as int),
      descricao: map['descricao'] as String,
      estabelecimentoId: map['estabelecimentoId'] as String,
      numeroLeitos: map['numeroLeitos'] as num,
      tipoSetor: map['tipoSetor'] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'dataRegistro': dataRegistro,
      'descricao': descricao,
      'estabelecimentoId': estabelecimentoId,
      'numeroLeitos': numeroLeitos,
      'tipoSetor': tipoSetor,
    };
  }

  UnitModel.fromJson(Map<String, Object?> json)
      : this(
          dataRegistro: json['dataRegistro']! as DateTime,
          descricao: json['descricao']! as String,
          estabelecimentoId: json['estabelecimentoId']! as String,
          numeroLeitos: json['numeroLeitos']! as num,
          tipoSetor: json['tipoSetor']! as String,
        );
}
