import 'dart:html';

import 'widget.dart';

abstract class Component {
  Widget widget;

  Component(Element attachmentPoint) {
    widget = build();
    attachmentPoint.children.add(widget.element);
    widget.render();
    widget.renderChildren();
  }

  Widget build();
}
