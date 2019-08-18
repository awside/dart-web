import 'dart:html';

import 'widget.dart';

abstract class Component {
  Widget widget;
  List<Component> children = [];
  Element parent;

  Component() {
    this.widget = build();
  }

  Widget build();

  attach(Element parent) {
    this.parent = parent;
    widget.attach(parent);
    for (var child in children) {
      child.attach(widget.element);
    }
  }

  remove() {
    widget.remove();
  }
}
