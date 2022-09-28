import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:book_club_app/presentation/widgets/search/search_list.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/SeachScreen';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.searchScreenTitle),
        ),
        body: const SearchList(),
      ),
    );
  }
}
