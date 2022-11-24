// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String estabelecimento;
  String nome;
  String email;
  bool ativo;

  UserModel._({
    required this.id,
    required this.estabelecimento,
    required this.nome,
    required this.email,
    required this.ativo,
  });

   UserModel({
    required this.id,
    required this.estabelecimento,
    required this.nome,
    required this.email,
    required this.ativo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'estabelecimento': estabelecimento,
      'nome': nome,
      'email': email,
      'ativo': ativo,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel._(
      estabelecimento: map['estabelecimento'] as String,
      nome: map['nome'] as String,
      id: map['id'] as String,
      email: map['email'] as String,
      ativo: map['ativo'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);


   factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final _snapshot = snapshot.data() as Map<String, dynamic>;
    return UserModel._(
      id: snapshot.id,
      nome: _snapshot['nome'],
      ativo: _snapshot['ativo'],
      estabelecimento: _snapshot['estabelecimento'],
      email: _snapshot['email']
    );
  }
}
