import 'package:isar/isar.dart';

part 'books.g.dart';

@collection
class Book {
  Id id = Isar.autoIncrement;

  String? title, author, publishYear, isbn;
}