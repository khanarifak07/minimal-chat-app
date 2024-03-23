import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myProvider = ChangeNotifierProvider((ref) => MyProvider());

class MyProvider extends ChangeNotifier {
  void printName(String name) {
    return log('Hello $name');
  }
}
