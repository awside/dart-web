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
  }) : super(element: DivElement(), child: child) {
    element.style
      ..display = 'flex'
      ..overflow = 'hidden'
      ..boxSizing = 'border-box'
      ..background = color?.color ?? Colors.transparent.color;
    (size ?? Size()).applyToElement(element);
    padding?.applyToElement(element);
    flex?.applyToElement(element);
    border?.applyToElement(element);
    shadow?.applyToElement(element);
  }
}
