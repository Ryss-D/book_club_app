import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../data/models/book_details.dart';

class ReadingListButton extends StatefulWidget {
  final Function callback;
  final BookDetails book;
  const ReadingListButton(
      {super.key, required this.callback, required this.book});

  @override
  State<ReadingListButton> createState() => _ReadingListButtonState();
}

class _ReadingListButtonState extends State<ReadingListButton> {
  bool isOnReadingList = false;
  @override
  toogleStatus() {
    setState(() {
      isOnReadingList = !isOnReadingList;
    });
  }

  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        toogleStatus();
        widget.callback();
      },
      icon: Icon(
        isOnReadingList
            ? Icons.local_fire_department_sharp
            : Icons.local_fire_department_outlined,
      ),
    );
  }
}
