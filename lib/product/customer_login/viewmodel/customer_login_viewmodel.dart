import 'package:flutter/material.dart';

class CustomerLoginViewModel extends ChangeNotifier {
  bool passwordVisible = true;

  void passwordChangeVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
}
