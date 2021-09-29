import 'package:flutter/cupertino.dart';

class PageProvider with ChangeNotifier {
  int _number;

  int get number => _number;

  set number(newValue) {
    _number = newValue;
    notifyListeners();
  }
}
