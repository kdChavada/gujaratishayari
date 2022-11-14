import 'package:flutter/material.dart';
import 'package:gujaratishayari/helper/only_shayri.dart';

import 'package:gujaratishayari/view/splash.dart';
import 'package:gujaratishayari/view/wel_come.dart';

import 'helper/shayri_db.dart';

DBHelper dbHelper = DBHelper();
OnlyShayri onlyShayri =  OnlyShayri();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gujarati Shayari',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: const Splash(),

    );
  }
}
