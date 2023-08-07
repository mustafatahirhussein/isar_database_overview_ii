import 'package:flutter/material.dart';
import 'package:isar_database_overview_ii/database/books.dart';
import 'package:isar_database_overview_ii/main.dart';

class AddBook extends StatefulWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {

  late final TextEditingController _title, _author, _publishYear, _isbn;

  @override
  void initState() {
    // TODO: implement initState
    _title = TextEditingController();
    _author = TextEditingController();
    _publishYear = TextEditingController();
    _isbn = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Book"),
      ),
      body: ListView(
        children: [

          formField(_title, 'Book Title'),
          formField(_author, 'Author'),
          formField(_publishYear, 'Year of Publication'),
          formField(_isbn, 'ISBN'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.infinity, 50),
          ),
          child: const Text("Save"),
          onPressed: () async {

            var item = await isar;
            final books = Book()..title = _title.text..author = _author.text..publishYear = _publishYear.text..isbn = _isbn.text;

            await item!.writeTxn(() async {
              await item.books.put(books);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added successfully")));
            });
          },
        ),
      ),
    );
  }

  Widget formField(TextEditingController controller, String hint) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
        ),
        textInputAction: controller == _isbn ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }
}
