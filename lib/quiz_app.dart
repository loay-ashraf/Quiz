import 'package:flutter/material.dart';
import 'package:quiz/gradient_container.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/questions_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: const [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          child: activeScreen == 'start-screen' ? StartScreen(startQuizAction: switchScreen) : const QuestionsScreen(),
        ),
      ),
    );
  }
}
