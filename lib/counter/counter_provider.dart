import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int _maxCount = 10;
  int get count => _count;
  int get maxCount => _maxCount;

  void addCount() {
    _count++;
    if (_count > _maxCount) {
      _count = 0;
    }
    notifyListeners();
  }

  void addMaxCount() {
    _maxCount++;
    notifyListeners();
  }

  void updateMaxCountFromTextField(int inputValue) {
    if (inputValue <= 0) {
      return;
    }
    _maxCount = inputValue;
    _count = 0;
    notifyListeners();
  }
}