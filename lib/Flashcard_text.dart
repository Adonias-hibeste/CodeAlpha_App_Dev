import "package:flutter/material.dart";

class Flashcard_text extends StatelessWidget {
  final String text;
  Flashcard_text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        color: Colors.green,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white),
        )));
  }
}
