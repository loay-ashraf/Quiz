import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/screens/questions/answer_button.dart';
import 'package:quiz/Data/questions.dart';
import 'package:quiz/navigation/coordinator/app_coordinator.dart';
import 'package:quiz/navigation/route/app_route.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.coordinator});

  final AppCoordinator coordinator;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];

  void answerQuestion({required String answer}) {
    // widget.onSelectAnswer(answer: answer);
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      widget.coordinator.trigger(
        route: AppRoute.summary,
        arguments: [selectedAnswers],
      );
      selectedAnswers = [];
    } else {
      setState(() {
        currentQuestionIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final currentQuestionAnswers = currentQuestion.getShuffledAnswers();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 201, 153, 251),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: currentQuestionAnswers.map(
              (item) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: AnswerButton(
                      onPressed: () {
                        answerQuestion(answer: item);
                      },
                      answerText: item),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
