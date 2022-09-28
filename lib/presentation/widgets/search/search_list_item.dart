import 'package:flutter/material.dart';

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
          onPressed: () {},
        ),
      ),
      onTap: () {
        //TODO:implement detail screen navigation
        //onTap: () => Navigator.of(context).pushNamed(
        //BookDetailScreen.routeName,
        //arguments: isbn,
        //),
      },
    );
  }
}
