import 'dart:html';

import 'widget_attribute.dart';

class GestureDetector extends WidgetAttribute {
  final Function(Event) onTap;

  GestureDetector({this.onTap});

  @override
  applyToElement(Element element) {
    if (onTap != null) element.addEventListener('click', onTap);
  }
}