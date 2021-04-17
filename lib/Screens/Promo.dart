import 'package:flutter/material.dart';
class PromoListState with ChangeNotifier {
  bool _isOpened = false;

  bool get isOpened => _isOpened;

  changePromoState() {
    _isOpened = !_isOpened;
    notifyListeners();
  }
}