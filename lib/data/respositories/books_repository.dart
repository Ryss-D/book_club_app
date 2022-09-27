import 'package:book_club_app/data/models/book_details.dart';

import '../data_providers/books_api.dart';
import '../models/book.dart';

class BooksRepository {
  final BooksAPI api = BooksAPI();

  Future<List<Book>> getBooks(searchType, criteria) async {
    final rawBooks = await api.getRawBooks(searchType, criteria);
    final List<Book> books = [];
    rawBooks.forEach((book) {
      books.add(
        Book.fromJson(book),
      );
    });
    return books;
  }

  Future<BookDetails> getBookDetails(isbn) async {
    final rawBook = await api.getRawBookDetails(isbn);
    final BookDetails book = BookDetails.fromJson(rawBook);
    return book;
  }
}
