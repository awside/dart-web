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
    // ref?.widget = this;
    element.style
      ..display = 'flex'
      ..flex = '1'
      ..flexDirection = 'column';
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
