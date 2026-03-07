import 'package:flutter/material.dart';

class Memo {
  String id;
  String title;
  String memoText;

  Memo({required this.id, required this.title, this.memoText = ''});
}

class MemoNotifier extends ChangeNotifier {
  final List<Memo> _memoList = [];

  List<Memo> get memoList => _memoList;
  bool get isMemoListEmpty => _memoList.isEmpty;

  void addMemo(String title, String memoText) {
    _memoList.add(Memo(id: DateTime.now().toString(), title: title, memoText: memoText));
    notifyListeners();
  }

  void removeMemo(Memo memo) {
    _memoList.remove(memo);
    notifyListeners();
  }
}