import 'package:flutter/material.dart';

class TemperatureProvider extends ChangeNotifier {
  double _celsius = 0.0;
  double _fahrenheit = 0.0;

  double get celsius => _celsius;
  double get fahrenheit => _fahrenheit;

  void updateCelsius(double inputValue) {
    if (inputValue < -273.15) {
      return;
    }
    _celsius = inputValue;
    _fahrenheit = _celsius * 1.8 + 32;
    notifyListeners();
  }
}