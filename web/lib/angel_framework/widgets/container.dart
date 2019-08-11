import 'dart:html';

import '../widget.dart';

class Container extends Widget {
  Container({
    Widget child,
    Container ref,
    Colors color,
    Size size,
    Padding padding,
    Flex flex,
    Border border,
    Shadow shadow,
  }) : super(
          element: DivElement(),
          child: child,
          widgetAttributeList: [
            color ?? Colors.transparent,
            size ?? Size(),
            padding,
            flex,
            border,
            shadow,
          ],
        ) {
    ref = this;
  }

  @override
  initialStyle() {
    element.style
      ..display = 'flex'
      ..overflow = 'hidden'
      ..boxSizing = 'border-box';
  }

  @override
  color(Colors color) {
    element.style.background = color.color;
  }
}
