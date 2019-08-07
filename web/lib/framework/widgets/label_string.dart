import 'dart:html';

import '../widget.dart';

class LabelString extends Widget {
  WidgetRef ref;
  List<Widget> children;

  LabelString({
    this.ref,
    this.children,
  }) : super(
          element: DivElement(),
          children: children,
        );

  @override
  render() {
    ref?.applyTo(this);
  }
}
