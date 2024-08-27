import 'package:flutter/material.dart';
import 'package:quotes_app/home.dart';
// ignore: unused_import

void main() => runApp(QuoteGenerator());

class QuoteGenerator extends StatelessWidget {
  const QuoteGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Home(),
    );
  }
}
