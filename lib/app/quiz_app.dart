import 'package:flutter/material.dart';
import 'package:quiz/app/gradient_container.dart';
import 'package:quiz/navigation/coordinator/app_coordinator.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  Widget? activeScreenWidget;
  AppCoordinator? coordinator;

  @override
  void initState() {
    coordinator = AppCoordinator(onTriggerRoute: updateActiveScreenWidget);
    activeScreenWidget = coordinator!.initial();
    super.initState();
  }

  void updateActiveScreenWidget({required Widget widget}) {
    setState(() {
      activeScreenWidget = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreenWidget != null) {
      return MaterialApp(
        title: 'Quiz',
        home: Scaffold(
          body: GradientContainer(
            colors: const [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            child: activeScreenWidget!,
          ),
        ),
      );
    } else {
      return const AlertDialog(
        icon: Icon(Icons.error),
        title: Text('Error'),
        content: Text('Failed to launch the app!'),
      );
    }
  }
}
