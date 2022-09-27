class Book {
  final String title;
  final String authorName;
  final String isbn;

  Book({required this.title, required this.authorName, required this.isbn});

  factory Book.fromJson(json) {
    return Book(
        title: json['title'],
        authorName: json['author_name'],
        isbn: json['isbn']);
  }
}
