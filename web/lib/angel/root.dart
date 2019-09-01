import 'dart:html';

import 'widget.dart';

class Root extends Widget {
  Root(
    Element target,
    Widget child,
  ) {
    element = target;
    children = [child];
    child.attach(this);
  }

  @override
  Widget build() {
    return null;
  }
}
