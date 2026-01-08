import 'package:flutter/material.dart';
import 'book.dart';

class LibraryProvider extends ChangeNotifier {
  final List<Book> _bookList = [];
  List<Book> _displayBooks = [];
  var _filterStatus = 'all';
  
  List<Book> get bookList => _bookList;
  List<Book> get displayBooks => _displayBooks;
  String get filterStatus => _filterStatus;

  void addBook(String title, String author) {
    _bookList.add(Book(id: DateTime.now().toString(), title: title, author: author));
    updateDisplayBooks();
    notifyListeners();
  }

  void removeBook(Book book) {
    _bookList.remove(book);
    updateDisplayBooks();
    notifyListeners();
  }

  void editBookTitle(Book book, String newTitle) {
    book.title = newTitle;
    updateDisplayBooks();
    notifyListeners();
  }

  void editBookAuthor(Book book, String newAuthor) {
    book.author = newAuthor;
    updateDisplayBooks();
    notifyListeners();
  }

  void updateBookAvailability(Book book) {
    book.isLent = !book.isLent;
    updateDisplayBooks();
    notifyListeners();
  }

  void changeFilter() {
    _filterStatus = switch (_filterStatus) {
      'all'         => 'available',
      'available'   => 'unavailable',
      'unavailable' => 'all',
      _             => 'all',
    };
    updateDisplayBooks();
    notifyListeners();
  }

  void updateDisplayBooks() {
    _displayBooks = switch (_filterStatus) {
      'all' => List.from(_bookList),
      'available' => bookList.where((book) => !book.isLent).toList(),
      'unavailable' => bookList.where((book) => book.isLent).toList(),
      _ => _bookList,
    };
    notifyListeners();
  }
}