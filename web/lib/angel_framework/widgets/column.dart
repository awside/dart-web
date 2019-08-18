import 'dart:html';

import '../widget.dart';

class Column extends Widget {
  Column({
    List<Widget> children,
  }) : super(element: DivElement(), children: children) {
    element.style
      ..width = '100%'
      ..height = '100%'
      ..display = 'flex'
      ..flexDirection = 'column';
  }
}
