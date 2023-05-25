import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLoadingAnimation extends StatelessWidget {
  const RiveLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
          'assets/loading_new.riv',
        );
  }
}