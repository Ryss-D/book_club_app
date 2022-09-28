import 'package:book_club_app/data/data_providers/books_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../logic/providers/books.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  SearchType _dropDownValue = SearchType.Title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: _dropDownValue == SearchType.Title
                  ? AppLocalizations.of(context)!.titleHint
                  : AppLocalizations.of(context)!.authorHint,
              contentPadding: const EdgeInsets.all(20.0),
            ),
            onChanged: (value) {
              Provider.of<Books>(context, listen: false)
                  .searchBooks(searchType: _dropDownValue, criteria: value);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: DropdownButton(
            value: _dropDownValue,
            underline: Container(),
            hint: Text(AppLocalizations.of(context)!.typeHint),
            items: [
              DropdownMenuItem(
                  value: SearchType.Title,
                  child: Text(AppLocalizations.of(context)!.title)),
              DropdownMenuItem(
                  value: SearchType.Author,
                  child: Text(AppLocalizations.of(context)!.author)),
            ],
            onChanged: ((SearchType? value) {
              setState(() {
                _dropDownValue = value!;
              });
            }),
          ),
        )
      ],
    );
  }
}
