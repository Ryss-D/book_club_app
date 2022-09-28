import 'package:flutter/material.dart';

class JumpingDot extends AnimatedWidget {
  final Animation<double> animation;
  const JumpingDot({Key? key, required this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: animation.value,
      child: const Text(
        '.',
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 85,
        ),
      ),
    );
  }
}
