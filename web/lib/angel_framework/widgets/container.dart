import 'dart:html';

import '../widget.dart';

class Container extends Widget {
  Container({
    Widget child,
    Colors color,
    Size size,
    Padding padding,
    Flex flex,
    Border border,
    Shadow shadow,
    GestureDetector gestureDetector,
    Anim startAnimation,
    Anim endAnimation,
  }) : super(element: DivElement(), child: child) {
    element.style
      ..display = 'flex'
      ..overflow = 'hidden'
      ..boxSizing = 'border-box'
      ..background = color?.color ?? Colors.transparent.color;
    widgetAttributes.addAll([
      size,
      padding,
      flex,
      border,
      shadow,
      gestureDetector,
    ]);
    this.startAnimation = startAnimation;
    this.endAnimation = endAnimation;
  }
}
