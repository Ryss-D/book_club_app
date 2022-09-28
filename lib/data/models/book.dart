class Book {
  final String title;
  final String authorName;
  final String isbn;

  Book({required this.title, required this.authorName, required this.isbn});

  factory Book.fromJson(json) {
    return Book(
      title: json['title'],
      authorName: json['author_name'] != null
          ? json['author_name'][0]
          : 'No authorin api',
      isbn: json['isbn'] != null ? json['isbn'][0] : 'No isbn in api',
    );
  }
}
