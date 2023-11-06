import 'package:flutter/material.dart';

class AwesomePageRoute extends PageRouteBuilder {
  AwesomePageRoute({
    RouteSettings? settings,
    Duration transitionDuration = const Duration(milliseconds: 300),
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    String? barrierLabel,
    bool maintainState = true,
    bool fullscreenDialog = false,
    required Widget enterPage,
    required Widget exitPage,
    required Transition transition,
  }) : super(
          settings: settings,
          pageBuilder: _getPageBuilder(enterPage),
          transitionsBuilder:
              _getTransitionBuilder(enterPage, exitPage, transition),
          transitionDuration: transitionDuration,
          opaque: opaque,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  static RoutePageBuilder _getPageBuilder(Widget child) {
    return (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        child;
  }

  static RouteTransitionsBuilder _getTransitionBuilder(
      Widget enterPage, Widget exitPage, Transition transition) {
    return (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
        transition.build(context, enterPage, exitPage, animation);
  }
}

abstract class Transition {
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation);
}

class StackTransition extends Transition {
  final Curve curve;

  StackTransition({
    this.curve = Curves.easeOutSine,
  });

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    double width = MediaQuery.of(context).size.width;
    return Transform(
      transform: Matrix4.identity()..translate(width * (1.0 - animation.value)),
      child: enterPage,
    );
  }
}

class ParallaxTransition extends Transition {
  final Curve curve;
  final double offset;

  ParallaxTransition({
    this.curve = Curves.easeOutSine,
    this.offset = 0.2,
  });

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(-width * animation.value),
          child: exitPage,
        ),
        ClipRect(
          clipper: ParallaxClipper(value: animation.value),
          child: Transform(
            transform: Matrix4.identity()
              ..translate(width * offset * (1.0 - animation.value)),
            child: enterPage,
          ),
        ),
      ],
    );
  }
}

class ParallaxClipper extends CustomClipper<Rect> {
  final double value;

  ParallaxClipper({required this.value});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(size.width * (1 - value), 0, size.width, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class DefaultTransition extends Transition {
  final Curve curve;
  final AxisDirection direction;

  DefaultTransition({
    this.curve = Curves.easeOutSine,
    this.direction = AxisDirection.left,
  });

  @override
  Widget build(BuildContext context, Widget enterPage, Widget exitPage,
      Animation<double> animation) {
    animation = CurvedAnimation(parent: animation, curve: curve);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(
                direction == AxisDirection.left
                    ? -width * animation.value
                    : direction == AxisDirection.right
                        ? width * animation.value
                        : 0.0,
                direction == AxisDirection.up
                    ? -height * animation.value
                    : direction == AxisDirection.down
                        ? height * animation.value
                        : 0.0),
          child: exitPage,
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(
                direction == AxisDirection.left
                    ? width * (1.0 - animation.value)
                    : direction == AxisDirection.right
                        ? -width * (1.0 - animation.value)
                        : 0.0,
                direction == AxisDirection.up
                    ? height * (1.0 - animation.value)
                    : direction == AxisDirection.down
                        ? -height * (1.0 - animation.value)
                        : 0.0),
          child: enterPage,
        ),
      ],
    );
  }
}
