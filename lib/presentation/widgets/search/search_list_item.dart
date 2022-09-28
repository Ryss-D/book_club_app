import 'package:flutter/material.dart';

import '../../screens/book_details_screen.dart';

class SearchListItem extends StatelessWidget {
  final String title;
  final String author;
  final String isbn;

  const SearchListItem(
      {super.key,
      required this.title,
      required this.author,
      required this.isbn});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ListTile(
          title: Text(title),
          subtitle: Text(author),
          trailing: IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () => Navigator.of(context).pushNamed(
              BookDetailsScreen.routeName,
              arguments: isbn,
            ),
          ),
        ),
        onTap: () => Navigator.of(context).pushNamed(
              BookDetailsScreen.routeName,
              arguments: isbn,
            ));
  }
}
