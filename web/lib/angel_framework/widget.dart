import 'dart:html';

import 'package:meta/meta.dart';

import 'attributes/widget_attributes.dart';
export 'attributes/widget_attributes.dart';

abstract class Widget {
  Element element;
  Widget child;
  List<Widget> children;
  List<WidgetAttribute> widgetAttributeList;

  Widget({
    @required this.element,
    Widget child,
    List<Widget> children,
    this.widgetAttributeList,
  }) {
    if (child != null) {
      this.child = child;
      element.children.add(child.element);
    }
    if (children != null) {
      this.children = children;
      element.children.addAll(children.map((v) => v.element).toList());
    }
    initialStyle();
    _applyAttributeListToWidget();
  }

  _applyAttributeListToWidget() {
    widgetAttributeList.removeWhere((value) => value == null);
    for (var widgetAttribute in widgetAttributeList) {
      if (widgetAttribute is Colors) {
        color(widgetAttribute);
      } else {
        widgetAttribute.applyToElement(element);
      }
    }
  }

  set set(WidgetAttribute widgetAttribute) {
    widgetAttribute.applyToElement(element);
  }

  @protected
  initialStyle() {}

  @protected
  color(Colors color) {}
}
