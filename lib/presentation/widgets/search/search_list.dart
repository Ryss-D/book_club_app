import 'package:book_club_app/presentation/widgets/search/search_box.dart';
import 'package:book_club_app/presentation/widgets/search/search_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/providers/books.dart';
import '../utils/jumping_dots_progresss_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBox(),
        Consumer<Books>(
          builder: (context, booksData, child) => booksData.books.isEmpty
              ? Expanded(
                  child: Center(
                      child:
                          Text(AppLocalizations.of(context)!.noValueToSearch)))
              : Expanded(
                  child: ListView.builder(
                    itemCount: booksData.books.length,
                    itemBuilder: ((context, index) => SearchListItem(
                        title: booksData.books[index].title,
                        author: booksData.books[index].authorName,
                        isbn: booksData.books[index].isbn)),
                  ),
                ),
        ),
      ],
    );
  }
}
