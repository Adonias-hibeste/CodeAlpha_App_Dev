import 'dart:convert';

import "package:flutter/material.dart";

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final String quoteURL = "http://api.adviceslip.com/advice";
  String quote = "To get Random Quotes hit generate";

  _fetchRandomQuotes() async {
    var res = await http.get(Uri.parse(quoteURL));
    var result = jsonDecode(res.body);
    print(result["slip"]["advice"]);
    setState(() {
      quote = result["slip"]["advice"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 40,
                height: 40,
              ),
              Text(
                "Quotes",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Monospace',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                quote,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "monospace",
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  _fetchRandomQuotes();
                },
                child: Text("GENERATE", style: TextStyle(color: Colors.black)),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, // Set the background color
                ),
              )
            ]),
          ),
        ));
  }
}
