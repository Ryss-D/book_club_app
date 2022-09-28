import 'package:book_club_app/data/models/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

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
        Provider.of<Books>(context).fetchDetails(isbn);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(isbn),
            actions: [
              IconButton(
                onPressed: () async {
                  setState(() {
                    isOnReadingList = true;
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
                  children: [
                    Image.network(snapshot.requireData.cover),
                    Text(snapshot.requireData.title),
                    Text(snapshot.requireData.subtitle),
                    Text(snapshot.requireData.author),
                    Text(
                      snapshot.requireData.numberOfPages,
                    )
                  ],
                );
              }
            },
          )),
    );
  }
}
