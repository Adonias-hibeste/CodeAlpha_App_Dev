import 'package:flashcard_app/Flashcard.dart';
import 'package:flashcard_app/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new Flashcard_app());

class Flashcard_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.light, primaryColor: Colors.green),
        home: home());
  }
}
