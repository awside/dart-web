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
    for (var child in children) {
      child.element.style.position = 'absolute';
    }
    element.style
      ..display = 'flex'
      ..flex = '1';
  }

  @override
  render() {
    ref?.applyTo(this);
  }
}
