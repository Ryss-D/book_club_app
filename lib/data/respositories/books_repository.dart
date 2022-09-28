import 'package:book_club_app/data/data_providers/books_db.dart';
import 'package:book_club_app/data/models/book_details.dart';

import '../data_providers/books_api.dart';
import '../models/book.dart';

class BooksRepository {
  //TODO: ENSURE DEPENDENCI INJECTION WITH GET IT
  final BooksAPI api = BooksAPI();
  final DBHelper db = DBHelper();

  Future<List<Book>> getBooks({required searchType, required criteria}) async {
    final rawBooks =
        await api.getRawBooks(searchType: searchType, criteria: criteria);
    final List<Book> books = <Book>[];
    rawBooks['docs'].forEach((book) {
      books.add(
        Book.fromJson(book),
      );
    });
    return books;
  }

  Future<BookDetails> getBookDetails(isbn) async {
    final rawBook = await api.getRawBookDetails(isbn);
    final firstCoincidence = rawBook?['records']?.keys.toList()?[0];
    final BookDetails book =
        BookDetails.fromJson(rawBook['records'][firstCoincidence]);
    return book;
  }

  Future<List<BookDetails>> getFavoriteBooks() async {
    final rawFavorites = await db.getData();
    //final List<BookDetails> favorites = rawFavorites.map((book)=>
    return rawFavorites
        .map((book) => BookDetails(
              title: book['title'],
              isbn: book['isbn'],
              subtitle: book['subtitle'],
              author: book['author'],
              numberOfPages: book['number_of_pages'],
              cover: book['cover'],
            ))
        .toList();
  }

  Future<void> addBookToFavorites(BookDetails book) async {
    await db.insert({
      'isbn': book.isbn,
      'title': book.title,
      'subtitle': book.subtitle,
      'number_of_page': book.numberOfPages,
      'author': book.author,
      'cover': book.cover
    });
  }

  Future<void> removeBookFromFavorites(isbn) async {
    await db.remove(isbn);
  }
}
