import 'dart:html';

import '../widget.dart';

class Container extends Widget {
  Container({
    Widget child,
    Container ref,
    Colors color = Colors.transparent,
    Size size,
  }) : super(
          element: DivElement(),
          child: child,
          widgetAttributeList: [
            color,
            size,
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
