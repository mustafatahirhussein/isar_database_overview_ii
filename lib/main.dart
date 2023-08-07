import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_database_overview_ii/app.dart';
import 'package:isar_database_overview_ii/database/books.dart';
import 'package:path_provider/path_provider.dart';

Future<Isar>? isar;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  isar = Isar.open(
    [BookSchema],
    directory: dir.path,
  );
  runApp(MyApp());
}
