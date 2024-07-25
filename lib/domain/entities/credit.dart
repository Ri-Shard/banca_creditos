import 'dart:ffi';

import 'package:flutter/material.dart';

class Credit {
  Credit(this.userId,
      {required this.amount,
      required this.date,
      required this.quota,
      required this.interest});

  final String date;
  final String quota;
  final String amount;
  final double interest;
  String userId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['userId'] = userId;
    data['interest'] = interest;
    data['quota'] = quota;
    data['amount'] = amount;
    return data;
  }
}
