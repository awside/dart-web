import 'dart:html';

import '../helper/widget.dart';

class Stack extends Widget {
  WidgetRef ref;
  List<Widget> children;

  Stack({
    this.ref,
    this.children,
  }) : super(
          element: DivElement(),
          children: children,
        ) {
    element.style
      ..display = 'grid'
      ..alignContent = 'center'
      ..flex = '1';
    for (var child in children) {
      child.element.style
        ..gridColumn = '1'
        ..gridRow = '1';
    }
  }

  @override
  render() {
    ref?.applyTo(this);
  }
}
