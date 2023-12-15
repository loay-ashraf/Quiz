import 'package:flutter/material.dart';
import 'package:quiz/navigation/route/route.dart' as route;

abstract class Coordinator<R extends route.Route> {
  const Coordinator({required this.onTriggerRoute});

  final void Function({required Widget widget}) onTriggerRoute;

  Widget initial();
  void trigger({required R route, List<Object>? arguments});
}