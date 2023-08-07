import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_database_overview_ii/add_book.dart';
import 'package:isar_database_overview_ii/database/books.dart';
import 'package:isar_database_overview_ii/main.dart';
import 'package:isar_database_overview_ii/widgets/book_view.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({Key? key}) : super(key: key);

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {

  List<Book> books = [];

  initBook() async {
    var i = await isar;

    i!.txn(() async {
      final b = i.books;
      books = await b.where().findAll();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Books"),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddBook())),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xffffffff),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            initBook();
          });
          return Future.value();
        },
        child: books.isEmpty ? const Center(
          child: Text("No Books"),
        ) : ListView.separated(
          itemCount: books.length,
          itemBuilder: (context, index) {

            Book item = books[index];
            return BookView(book: item, onDelete: () async {

              var i = await isar;
              await i!.writeTxn(() async {
                final success = await i.books.delete(index + 1);
                debugPrint('Book deleted: $success');
              });

              setState(() {});
            },);
          },
          separatorBuilder: (context, i) => const Divider(),
        ),
      ),
    );
  }
}
