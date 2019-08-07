import 'dart:html';

import '../widget.dart';

class Row extends Widget {
  WidgetRef ref;
  List<Widget> children;
  String justifyContent;

  Row({
    this.ref,
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
  render() {
    ref?.applyTo(this);
  }
}
