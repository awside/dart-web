import 'dart:html';

import 'package:meta/meta.dart';

import 'attributes/widget_attributes.dart';
export 'attributes/widget_attributes.dart';

abstract class Widget {
  Element element;
  Widget child;
  List<Widget> children;

  Widget.component();

  Widget({
    @required this.element,
    Widget child,
    List<Widget> children,
  }) {
    if (child != null) {
      this.child = child;
      element.children.add(child.element);
    }
    if (children != null) {
      this.children = children;
      element.children.addAll(children.map((v) => v.element).toList());
    }
  }

  set apply(WidgetAttribute widgetAttribute) {
    widgetAttribute.applyToElement(element);
  }
}
