import 'package:flutter/cupertino.dart';

class PageProvider with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  set number(newValue) {
    _number = newValue;
    notifyListeners();
  }
}
