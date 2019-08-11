import 'dart:html';

import '../widget.dart';

class Row extends Widget {
  List<Widget> children;
  String justifyContent;

  Row({
    this.children,
    this.justifyContent,
  }) : super(
          element: DivElement(),
          children: children,
        ) {
    element.style
      ..display = 'flex'
      ..flex = '1'
      ..flexDirection = 'row';
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
