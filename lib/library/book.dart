class Book {
  String id;
  String title;
  String author;
  bool isLent;

  Book({required this.id, required this.title, required this.author, this.isLent = false});
}