class BookDetails {
  final String title;
  final String subtitle;
  final String isbn;
  final String author;
  final String numberOfPages;
  final String cover;

  BookDetails({
    required this.title,
    required this.isbn,
    required this.subtitle,
    required this.author,
    required this.numberOfPages,
    required this.cover,
  });

  factory BookDetails.fromJson(json) {
    return BookDetails(
      title: json['title'],
      subtitle: json['subtitle'],
      isbn: json['isbns'][0],
      author: json['authors'][0]['name'],
      numberOfPages: json['numberOfPages'],
      cover: json['cover']['small'],
    );
  }
}
