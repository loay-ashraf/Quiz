import 'package:flutter/material.dart';
import 'package:quiz/app/gradient_container.dart';
import 'package:quiz/screens/summary/summary_screen.dart';
import 'package:quiz/screens/home/home_screen.dart';
import 'package:quiz/screens/questions/questions_screen.dart';
import 'package:quiz/data/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';

  void startQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void selectAnswer({required String answer}) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void goHome() {
    selectedAnswers = [];

    setState(() {
      activeScreen = 'start_screen';
    });
  }

  void restartQuiz() {
    selectedAnswers = [];

    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(onStartQuiz: startQuiz);

    if (activeScreen == 'start-screen') {
      screenWidget = HomeScreen(onStartQuiz: startQuiz);
    } else if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: selectAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = SummaryScreen(onGoHome: goHome,
        onRestart: restartQuiz,
        selectedAnswers: selectedAnswers,);
    }

    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: const [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          child: screenWidget,
        ),
      ),
    );
  }
}