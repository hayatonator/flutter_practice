import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  String _message = '';

  String get message => _message;

  void editMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}