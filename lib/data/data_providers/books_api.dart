import 'dart:convert';
import 'package:http/http.dart' as http;

enum SearchType {
  Title,
  Author,
}

class BooksAPI {
  Future getRawBooks(
      {required SearchType searchType, required criteria}) async {
    criteria = prepare_criteria(criteria);
    final Uri url;

    if (searchType == SearchType.Author) {
      url = Uri.parse(
          'http://openlibrary.org/search.json?author=$criteria&limit=100');
    } else if (searchType == SearchType.Title) {
      url = Uri.parse(
          'http://openlibrary.org/search.json?title=$criteria&limit=100');
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

  String prepare_criteria(String criteria) {
    criteria = criteria.replaceAll(' ', '+');
    return criteria;
  }
}
