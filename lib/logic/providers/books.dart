import 'package:book_club_app/data/data_providers/books_api.dart';
import 'package:book_club_app/data/models/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../data/models/book.dart';
import '../../data/respositories/books_repository.dart';

class Books with ChangeNotifier {
  //TODO ensure injection dependentices
  final BooksRepository repository = BooksRepository();
  List<BookDetails> _favoriteBooks = <BookDetails>[];
  List<Book> _books = <Book>[];

  List<Book> get books {
    return [..._books];
  }

  List<BookDetails> get favoriteBooks {
    return [..._favoriteBooks];
  }

  Future<void> fetchBooks() async {
    _favoriteBooks = await repository.getFavoriteBooks();
    notifyListeners();
  }

  Future<void> searchBooks(
      {required SearchType searchType, required criteria}) async {
    _books =
        await repository.getBooks(searchType: searchType, criteria: criteria);
    notifyListeners();
  }
}
