import 'package:flutter/material.dart';

@immutable
class UserModel {
  final String email;
  final String password;

  UserModel({
    this.email = '',
    this.password = '',
  });

  UserModel copyWith({
    String? email,
    String? password,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
