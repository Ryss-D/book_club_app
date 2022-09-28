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
      title: json['data']['title'],
      subtitle: json['data']['subtitle'],
      isbn: json['isbns'][0],
      author: json['data']['authors'][0]['name'],
      numberOfPages: json['data']['number_of_pages'].toString(),
      cover: json['data']['cover']['small'],
    );
  }
}
