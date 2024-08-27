import 'package:flashcard_app/Flashcard.dart';
import 'package:flashcard_app/Flashcard_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final List<Flashcard> _flashcards = [
    Flashcard(question: 'this is question 1', answer: 'this is answer 1'),
    Flashcard(question: 'this is question 2', answer: 'this is answer 2'),
    Flashcard(question: 'this is question 3', answer: 'this is answer 3'),
    Flashcard(question: 'this is question 4', answer: 'this is answer 4'),
    Flashcard(question: 'this is question 5', answer: 'this is answer 5'),
    Flashcard(question: 'this is question 6', answer: 'this is answer 6'),
  ];
  int _currindex = 0;

  void nextbutton() {
    setState(() {
      _currindex = (_currindex + 1 < _flashcards.length) ? _currindex + 1 : 0;
    });
  }

  void previousbutton() {
    setState(() {
      _currindex =
          (_currindex - 1 >= 0) ? _currindex - 1 : _flashcards.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('FlashCard Quiz App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 250,
                height: 250,
                child: FlipCard(
                    front:
                        Flashcard_text(text: _flashcards[_currindex].question),
                    back:
                        Flashcard_text(text: _flashcards[_currindex].answer))),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: previousbutton,
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Prev",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green, // Set the background color
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: nextbutton,
                  icon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  label: Text("Next", style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green, // Set the background color
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {
                _showDialog(context);
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text("Add Flash-Cards",
                  style: TextStyle(color: Colors.white)),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green, // Set the background color
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {
                _showDialog2(context);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              label: Text("Delete", style: TextStyle(color: Colors.white)),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red, // Set the background color
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    final TextEditingController _controller1 = TextEditingController();
    final TextEditingController _controller2 = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Your Flash Cards'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _controller1,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Question',
                  hintText: 'Enter the question',
                ),
              ),
              TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  labelText: 'Answer',
                  hintText: 'Enter the answer',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: Text('Submit'),
                onPressed: () {
                  setState(() {
                    _flashcards.add(Flashcard(
                        question: _controller1.text,
                        answer: _controller2.text));
                  });
                  _controller1.clear();
                  _controller2.clear();
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }

  void _showDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert "),
          content: Text(
              'The current flashcard will be removed to continue click confirm and to stop click cancel'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  setState(() {
                    _flashcards.removeAt(_currindex);
                  });
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
}
