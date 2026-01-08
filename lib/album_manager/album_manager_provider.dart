import 'package:flutter/material.dart';
import 'album.dart';

class AlbumManagerProvider extends ChangeNotifier {
  final List<Album> _albumList = [];

  List<Album> get albumList => _albumList;

  void addAlbum(String inputAlbumName) {
    _albumList.add(Album(name: inputAlbumName));
    notifyListeners();
  }

  void deleteAlbumWithIndex(int index) {
    _albumList.removeAt(index);
    notifyListeners();
  }
}