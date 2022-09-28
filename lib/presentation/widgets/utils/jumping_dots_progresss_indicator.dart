import 'package:flutter/material.dart';

import 'jumping_dot.dart';

class JumpingDotsProgressIndicator extends StatefulWidget {
  final int numberOfDots;
  final double beginTweenValue = 0.0;
  final double endTweenValue = 30.0;

  const JumpingDotsProgressIndicator({super.key, this.numberOfDots = 3});

  @override
  State<JumpingDotsProgressIndicator> createState() =>
      _JumpingDotsProgressIndicatorState();
}

class _JumpingDotsProgressIndicatorState
    extends State<JumpingDotsProgressIndicator> with TickerProviderStateMixin {
  @override
  initState() {
    super.initState();
    for (int i = 0; i < numberOfDots; i++) {
      controllers.add(AnimationController(
          duration: const Duration(milliseconds: 450), vsync: this));
      animations.add(Tween(
              begin: widget.beginTweenValue, end: widget.endTweenValue)
          .animate(controllers[i])
        ..addStatusListener((AnimationStatus status) {
          if (status == AnimationStatus.completed) controllers[i].reverse();
          if (i == numberOfDots - 1 && status == AnimationStatus.dismissed) {
            controllers[0].forward();
          }
          if (animations[i].value > widget.endTweenValue / 2 &&
              i < numberOfDots - 1) {
            controllers[i + 1].forward();
          }
        }));
      _widgets.add(Padding(
        padding: EdgeInsets.only(right: 1.0),
        child: JumpingDot(
          animation: animations[i],
        ),
      ));
    }
    controllers[0].forward();
  }

  int numberOfDots;
  List<AnimationController> controllers = <AnimationController>[];
  List<Animation<double>> animations = <Animation<double>>[];
  final List<Widget> _widgets = <Widget>[];

  _JumpingDotsProgressIndicatorState({
    this.numberOfDots = 3,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _widgets,
      ),
    );
  }

  @override
  dispose() {
    for (int i = 0; i < numberOfDots; i++) {
      controllers[i].dispose();
    }
    super.dispose();
  }
}
