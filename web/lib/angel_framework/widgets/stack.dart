import 'dart:html';

import '../widget.dart';

class Stack extends Widget {
  List<Widget> children;

  Stack({
    this.children,
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

  @override
  initialStyle() {
    // TODO: implement initialStyle
    return null;
  }

  // @override
  // render() {
  //   ref?.applyTo(this);
  // }
}
