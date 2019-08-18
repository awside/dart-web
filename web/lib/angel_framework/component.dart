import 'dart:html';

import 'widget.dart';
import 'widget_base.dart';

abstract class Component extends WidgetBase {
  Element parentElement;
  Widget buildWidget;

  Component() {
    this.buildWidget = build();
  }

  Widget build();

  activate(Element parentElement) {
    this.parentElement = parentElement;
    buildWidget.activate(parentElement);
  }

  remove() {
    if (parentElement != null) buildWidget.activate(parentElement);
  }
}
