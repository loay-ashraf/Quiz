import 'package:flutter/material.dart';
import 'coordinator.dart';
import 'package:quiz/navigation/route/app_route.dart';
import 'package:quiz/screens/home/home_screen.dart';
import 'package:quiz/screens/questions/questions_screen.dart';
import 'package:quiz/screens/summary/summary_screen.dart';

class AppCoordinator extends Coordinator<AppRoute> {
  const AppCoordinator({required super.onTriggerRoute});

  @override
  Widget initial() {
    return HomeScreen(
      coordinator: this,
    );
  }

  @override
  void trigger({required AppRoute route, List<Object>? arguments}) {
    Widget? widget;
    switch (route) {
      case AppRoute.home:
        widget = HomeScreen(
          coordinator: this,
        );
      case AppRoute.questions:
        widget = QuestionsScreen(
          coordinator: this,
        );
      case AppRoute.summary:
        if (arguments != null) {
          List<String> selectedAnswers = arguments.first as List<String>;
          widget = SummaryScreen(
            coordinator: this,
            selectedAnswers: selectedAnswers,
          );
        }
    }
    if (widget != null) {
      onTriggerRoute(widget: widget);
    }
  }
}