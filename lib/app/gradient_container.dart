import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors, required this.begin, required this.end, required this.child});

  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: begin,
          end: end,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}