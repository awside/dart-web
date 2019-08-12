import 'dart:html';

import 'package:meta/meta.dart';

import 'attributes/widget_attributes.dart';
export 'attributes/widget_attributes.dart';

abstract class Widget {
  Element element;
  Widget child;
  List<Widget> children;
  GestureDetector gestureDetector;

  Widget.component() {
    _sharedStyles();
  }

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
    _sharedStyles();
  }

  passThrough(bool value) {
    element.style.pointerEvents = value ? 'none' : 'auto';
    for (var child in element.querySelectorAll('*')) {
      child.style.pointerEvents = value ? 'none' : 'auto';
    }
  }

  _sharedStyles() {
    gestureDetector = GestureDetector(element);
  }

  set apply(WidgetAttribute widgetAttribute) {
    widgetAttribute.applyToElement(element);
  }
}
