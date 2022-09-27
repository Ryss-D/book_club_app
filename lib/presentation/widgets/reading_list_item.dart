import 'package:flutter/material.dart';

class ReadingListItem extends StatelessWidget {
  final String title;
  final String cover;
  final String author;
  final String isbn;

  const ReadingListItem(
      {super.key,
      required this.title,
      required this.cover,
      required this.author,
      required this.isbn});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(isbn),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do  you want to remove this post?'),
                  actions: [
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: const Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                ));
      },
      onDismissed: (direction) {
        //  Provider.of<Posts>(context, listen: false).removePost(postId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            minLeadingWidth: 5,
            leading: Image.network(cover),
            title: Text(title),
            trailing: IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () {},
              //onPressed: () => Navigator.of(context).pushNamed(
              //BookDetailScreen.routeName,
              //arguments: isbn,
              //),
            ),
          ),
        ),
      ),
    );
  }
}