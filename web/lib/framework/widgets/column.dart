import 'dart:html';

import '../helper/widget.dart';

class Column extends Widget {
  WidgetRef ref;
  List<Widget> children;
  String justifyContent;

  Column({
    this.ref,
    this.children,
    this.justifyContent,
  }) : super(
          element: DivElement(),
          children: children,
        ) {
    ref?.widget = this;
    element.style
      ..display = 'flex'
      ..flex = '1'
      ..flexDirection = 'column';
  }

  @override
  render() {
    ref?.applyTo(this);
  }
}
