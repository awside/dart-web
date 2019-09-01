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
  }) {
    element = DivElement();
    element.style
      ..display = 'flex'
      ..overflow = 'hidden'
      ..boxSizing = 'border-box'
      ..background = color?.color ?? Colors.transparent.color;
    children = [child]..removeWhere((e) => e == null);
    size?.width = '100%';
    widgetAttributes = [
      size,
      padding,
      flex,
      border,
      shadow,
      gestureDetector,
    ]..removeWhere((e) => e == null);
  }

  @override
  Widget build() {
    return null;
  }
}
