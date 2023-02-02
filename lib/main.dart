import 'package:flutter/material.dart';
import 'color.dart';
import 'questions-and-answers.dart';
import 'quiz.dart';
import 'result.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwiched = false;
  int questionIndex = 0;
  int totalScore = 0;
  int counter = 0;
  Random random = new Random();

  void increaseQuestionIndex(int question, int score) {
      totalScore += score;
      counter++;
      setState(() {
        questionIndex = question;
      });
  }


  void restartApp() {
    totalScore = 0;
    counter = 0;
    setState(() {
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Switch(
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.red,
              value: isSwiched,
              onChanged: (value) {
                setState(() {
                  isSwiched = value;
                  if (isSwiched == true) {
                    white = Colors.black;
                    black = Colors.white;
                  } else {
                    white = Colors.white;
                    black = Colors.black;
                  }
                });
              }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        height: double.infinity,
        width: double.infinity,
        color: white,
        child: Column(children: [
          const Text(
            "اسئلة ثقافية",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          counter < 10
              ? Quiz(random.nextInt(100), increaseQuestionIndex)
              : Result(restartApp, totalScore),
        ]),
      ),
    );
  }
}