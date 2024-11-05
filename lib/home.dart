import 'package:flashcard_app/Flashcard.dart';
import 'package:flashcard_app/Flashcard_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Flashcard> _flashcards = [
    Flashcard(
        question: 'What is the difference between climate and weather?',
        answer:
            'Climate is long-term atmospheric conditions; weather is short-term.'),
    Flashcard(
        question: 'What is the central idea of "The Road Not Taken"',
        answer: 'Choices and their impact on our future.'),
    Flashcard(
        question: 'What are the three branches of U.S. government?',
        answer: 'Legislative, Executive, Judicial.'),
    Flashcard(
        question: 'What are the main themes of "1984"?',
        answer:
            'Totalitarianism, surveillance, manipulation of truth, and individual vs. collective identity.'),
    Flashcard(
        question: 'What do mitochondria do?',
        answer:
            'Produce ATP through cellular respiration and regulate metabolism.'),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen[200]!, Colors.green[600]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: Flashcard_text(text: _flashcards[_currindex].question),
                  back: Flashcard_text(text: _flashcards[_currindex].answer),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: previousbutton,
                    icon: Icon(Icons.chevron_left, color: Colors.white),
                    label: Text("Prev", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: nextbutton,
                    icon: Icon(Icons.chevron_right, color: Colors.white),
                    label: Text("Next", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  _showDialog(context);
                },
                icon: Icon(Icons.add, color: Colors.white),
                label: Text("Add Flash-Cards",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  _showDialog2(context);
                },
                icon: Icon(Icons.delete, color: Colors.white),
                label: Text("Delete", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ],
          ),
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
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  labelText: 'Answer',
                  hintText: 'Enter the answer',
                  border: OutlineInputBorder(),
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
          title: Text("Alert"),
          content: Text(
              'The current flashcard will be removed. Click confirm to continue or cancel to stop.'),
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
