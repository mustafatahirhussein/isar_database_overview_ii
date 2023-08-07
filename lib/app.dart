import 'package:flutter/material.dart';
import 'package:isar_database_overview_ii/all_books.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllBooks(),
    );
  }
}