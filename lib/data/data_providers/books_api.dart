import 'dart:convert';
import 'package:http/http.dart' as http;

enum SearchType {
  Title,
  Author,
}

class BooksAPI {
  Future getRawBooks(SearchType searchType, criteria) async {
    final url;
    if (searchType == SearchType.Author) {
      url = Uri.parse('http://openlibrary.org/search.json?author=$criteria');
    } else if (searchType == SearchType.Title) {
      url = Uri.parse('http://openlibrary.org/search.json?title=$criteria');
    } else
      return;

    try {
      final response = await http.get(url);
      final rawBooks = json.decode(response.body);

      return rawBooks;
    } catch (error) {}
  }

  Future getRawBookDetails(isbn) async {
    final url =
        Uri.parse('http://openlibrary.org/api/volumes/brief/isbn/$isbn.json');
    try {
      final response = await http.get(url);
      final rawBookDetails = json.decode(response.body);

      return rawBookDetails;
    } catch (error) {}
  }
}
