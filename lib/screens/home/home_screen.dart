import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/navigation/coordinator/app_coordinator.dart';
import 'package:quiz/navigation/route/app_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.coordinator});

  final AppCoordinator coordinator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 237, 223, 252),
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: () {
            coordinator.trigger(route: AppRoute.questions);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 12),
            shape: const BeveledRectangleBorder(),
          ),
          icon: const Icon(Icons.arrow_forward),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
