import 'package:flutter/material.dart';
import 'user.dart';

class ProfileManagerProvider extends ChangeNotifier {
  final User _user = User();

  User get user => _user;

  void updateName(String newName) {
    _user.name = newName;
    notifyListeners();
  }

  void updateAge(int newAge) {
    if (newAge < 0) {
      return;
    }
    _user.age = newAge;
    notifyListeners();
  }
}