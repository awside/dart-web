import 'dart:html';

import '../widget.dart';

class VStack extends Widget {
  VStack({
    List<Widget> children,
  }) {
    element = DivElement();
    element.style
      ..width = '100%'
      ..height = '100%'
      ..display = 'flex'
      ..flexDirection = 'column';
    this.children = [...children]..removeWhere((e) => e == null);
  }

  @override
  Widget build() {
    return null;
  }
}
