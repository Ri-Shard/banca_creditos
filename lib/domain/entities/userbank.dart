import 'package:flutter/material.dart';

class UserBank {
  const UserBank(
      {required this.name,
      required this.id,
      required this.email,
      required this.password});

  final String name;
  final String id;
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['email'] = email;
    return data;
  }
}
