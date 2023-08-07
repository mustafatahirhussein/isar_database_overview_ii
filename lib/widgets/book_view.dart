import 'package:flutter/material.dart';
import 'package:isar_database_overview_ii/database/books.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key, required this.book, required this.onDelete,}) : super(key: key);

  final Book book;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 3,
        vertical: 5,
      ),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(book.id.toString()),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(book.title!, style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),),
              Text(book.author!),
              Text(book.publishYear!),
              Text('ISBN - ${book.isbn!}'),
            ],
          ),
          Spacer(),
          InkWell(onTap: onDelete, child: Icon(Icons.clear)),
        ],
      ),
    );
  }
}
