import 'dart:html';

import '../widget.dart';

class Column extends Widget {
  Column({
    List<Widget> children,
  }) {
    element = DivElement();
    element.style
      ..width = '100%'
      ..height = '100%'
      ..display = 'flex'
      ..flexDirection = 'column';
    children = [...children]..removeWhere((e) => e == null);
  }

  @override
  Widget build() {
    return null;
  }
}
