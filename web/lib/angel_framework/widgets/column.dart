import 'dart:html';

import '../widget.dart';

class Column extends Widget {
  List<Widget> children;
  String justifyContent;

  Column({
    this.children,
    this.justifyContent,
  }) : super(
          element: DivElement(),
          children: children,
        ) {
    element.style
      ..display = 'flex'
      ..flex = '1'
      ..flexDirection = 'column';
  }
}
