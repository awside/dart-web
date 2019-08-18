import 'dart:html';

import 'widget.dart';

abstract class Component {
  Widget widget;
  Element parent;

  Component() {
    this.widget = build();
  }

  Widget build();

  attach(Element parent) {
    this.parent = parent;
    widget.attach(parent);
    widget.animate();
  }

  remove() {
    widget.remove();
  }
}
