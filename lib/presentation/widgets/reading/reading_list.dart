import 'package:book_club_app/data/models/book_details.dart';
import 'package:book_club_app/presentation/widgets/utils/jumping_dots_progresss_indicator.dart';
import 'package:book_club_app/presentation/widgets/reading/reading_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../logic/providers/books.dart';

class ReadingList extends StatefulWidget {
  const ReadingList({super.key});

  @override
  State<ReadingList> createState() => _ReadingListState();
}

class _ReadingListState extends State<ReadingList> {
  late Future<void> _favoriteBooksFuture;
  @override
  void initState() {
    super.initState();
    _favoriteBooksFuture =
        Provider.of<Books>(context, listen: false).fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _favoriteBooksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const JumpingDotsProgressIndicator();
        } else {
          return Consumer<Books>(
            builder: (context, booksData, child) => booksData
                    .favoriteBooks.isEmpty
                ? Center(child: Text(AppLocalizations.of(context)!.noFavorites))
                : ListView.builder(
                    itemCount: booksData.favoriteBooks.length,
                    itemBuilder: ((context, index) => ReadingListItem(
                        title: booksData.favoriteBooks[index].title,
                        cover: booksData.favoriteBooks[index].cover,
                        author: booksData.favoriteBooks[index].author,
                        isbn: booksData.favoriteBooks[index].isbn)),
                  ),
          );
        }
      },
    );
  }
}
