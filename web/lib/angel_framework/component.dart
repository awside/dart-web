import 'dart:html';

import 'widget.dart';
import 'widget_base.dart';

abstract class Component extends WidgetBase {
  Element parentElement;
  Widget widget;

  Component() {
    this.widget = build();
  }

  Widget build();

  activate(Element parentElement) {
    this.parentElement = parentElement;
    widget.activate(parentElement);
  }

  remove() {
    if (parentElement != null) widget.activate(parentElement);
  }
}
