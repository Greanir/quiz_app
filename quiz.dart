import 'package:flutter/material.dart';
import 'package:spurninga_app/data/question.dart';
import 'package:spurninga_app/questions.dart';
import 'package:spurninga_app/start_screen.dart';
import 'package:spurninga_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override

  State<Quiz> createState()  {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

 

  void switchScreen(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

   void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }
  
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

  if (activeScreen == 'question-screen') {
    screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer,);
  }

  if (activeScreen == 'result-screen') {
    screenWidget =  ResultsScreen(
      chosenAnswers: selectedAnswers,
      onRestart: restartQuiz,);
  }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(
            colors: [
             Color.fromARGB(255, 113, 55, 213),
             Color.fromARGB(255, 56, 27, 106)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
            ),
          child: screenWidget
        ),
      ),
    );
  }
  }
