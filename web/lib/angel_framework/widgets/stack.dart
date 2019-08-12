import 'dart:html';

import '../widget.dart';

class Stack extends Widget {
  Stack({
    List<Widget> children,
  }) : super(
          element: DivElement(),
          children: children,
        ) {
    element.style
      ..flex = '1'
      ..display = 'grid'
      ..alignItems = 'stretch';

    for (var child in children) {
      child.element.style
        ..gridColumn = '1'
        ..gridRow = '1';
    }
  }
}
