import 'package:book_club_app/data/data_providers/books_api.dart';
import 'package:book_club_app/data/data_providers/books_db.dart';
import 'package:book_club_app/data/respositories/books_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<BooksAPI>(BooksAPI());
  getIt.registerSingleton<DBHelper>(DBHelper());
}
