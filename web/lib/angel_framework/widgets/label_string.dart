import 'dart:html';

import '../widget.dart';

class LabelString extends Widget {
  List<Widget> children;

  LabelString({
    this.children,
  }) : super(
          element: DivElement(),
          children: children,
        );

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
