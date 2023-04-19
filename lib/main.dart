import 'package:flutter/material.dart';
import 'package:flutter_application_1/result.dart';
import './quiz.dart';
import './result.dart';

// void main(){
  
//   runApp(MyApp());
// }
void main() =>  runApp(MyApp());

class MyApp extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  
  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'what\s you favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'tiger', 'score': 5},
        {'text': 'Dog', 'score': 3},
        {'text': 'cat', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Colt Steele', 'score': 10},
        {'text': 'Angila Yu', 'score': 10},
        {'text': 'Vikalp ', 'score': 10},
        {'text': 'Prateek', 'score': 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    var questions;
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print('NO more questions!');
    }
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // 'What\'s your favorite color?',

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
