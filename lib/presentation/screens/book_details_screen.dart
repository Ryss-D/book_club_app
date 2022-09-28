import 'package:book_club_app/data/models/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../logic/providers/books.dart';
import '../widgets/utils/jumping_dots_progresss_indicator.dart';

class BookDetailsScreen extends StatefulWidget {
  static const routeName = 'posts_list';
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool isOnReadingList = false;
  @override
  Widget build(BuildContext context) {
    final String isbn = ModalRoute.of(context)?.settings.arguments as String;
    final Future<BookDetails> bookDetailsFuture =
        Provider.of<Books>(context, listen: false).fetchDetails(isbn);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(isbn),
            actions: [
              IconButton(
                onPressed: () async {
                  setState(() {
                    isOnReadingList = !isOnReadingList;
                  });
                  Provider.of<Books>(context, listen: false)
                      .addToReadingList(await bookDetailsFuture);
                },
                icon: Icon(
                  isOnReadingList
                      ? Icons.local_fire_department_sharp
                      : Icons.local_fire_department_outlined,
                ),
              )
            ],
          ),
          body: FutureBuilder(
            future: bookDetailsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: JumpingDotsProgressIndicator());
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.all(25),
                      height: 230,
                      width: 140,
                      child: Image.network(snapshot.requireData.cover,
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 25),
                    Text(
                        '${AppLocalizations.of(context)!.title}:  ${snapshot.requireData.title}'),
                    const SizedBox(height: 15),
                    Text(
                        '${AppLocalizations.of(context)!.subtitle}:  ${snapshot.requireData.subtitle}'),
                    const SizedBox(height: 15),
                    Text(
                        '${AppLocalizations.of(context)!.author}:  ${snapshot.requireData.author}'),
                    const SizedBox(height: 15),
                    Text(
                      '${AppLocalizations.of(context)!.numberOfPages}:  ${snapshot.requireData.numberOfPages}',
                    )
                  ],
                );
              }
            },
          )),
    );
  }
}
