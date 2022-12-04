import 'package:cloud_firestore/cloud_firestore.dart';

class UnitModel {
  Timestamp dataRegistro;
  String descricao;
  String estabelecimentoId;
  num numeroLeitos;
  String tipoSetor;

    UnitModel._({
    required this.dataRegistro,
    required this.descricao,
    required this.estabelecimentoId,
    required this.numeroLeitos,
    required this.tipoSetor,
  });

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
          Timestamp.fromMillisecondsSinceEpoch(map['dataRegistro'] as int),
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
          dataRegistro: json['dataRegistro']! as Timestamp,
          descricao: json['descricao']! as String,
          estabelecimentoId: json['estabelecimentoId']! as String,
          numeroLeitos: json['numeroLeitos']! as num,
          tipoSetor: json['tipoSetor']! as String,
        );


   factory UnitModel.fromSnapshot(DocumentSnapshot snapshot) {
    final _snapshot = snapshot.data() as Map<String, dynamic>;
    return UnitModel._(
      dataRegistro: _snapshot['dataRegistro'],
      descricao: _snapshot['descricao'],
      estabelecimentoId: _snapshot['estabelecimentoId'],
      numeroLeitos: _snapshot['numeroLeitos'],
      tipoSetor: _snapshot['tipoSetor'],
    );
  }
}
