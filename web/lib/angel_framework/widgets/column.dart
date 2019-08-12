import 'dart:html';

import '../widget.dart';

class Column extends Widget {
  Column({
    List<Widget> children,
  }) : super(element: DivElement(), children: children) {
    element.style
      // ..flex = '1'
      ..display = 'flex'
      ..flexDirection = 'column';
  }
}
