import 'dart:ffi';

import 'package:flutter/material.dart';

class Credit {
  const Credit(this.userId,
      {required this.amount,
      required this.date,
      required this.fee,
      required this.interest});

  final Int amount;
  final DateTime date;
  final int fee;
  final double interest;
  final String userId;
}
