import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int sayi = 0;

  void sayiArttir() {
    sayi += 1;
    notifyListeners();
  }

  void sayiAzalt() {
    sayi -= 1;
    notifyListeners();
  }
}
