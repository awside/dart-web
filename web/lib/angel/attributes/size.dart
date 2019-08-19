import 'dart:html';

import 'widget_attribute.dart';

class Size extends WidgetAttribute {
  dynamic width;
  dynamic height;

  Size({
    this.width = '100%',
    this.height = '100%',
  });

  Size.square(double value) {
    width = value;
    height = value;
  }

  @override
  applyToElement(Element element) {
    if (width.runtimeType == String) element.style.width = width;
    if (width.runtimeType == int || width.runtimeType == double) {
      element.style.width = '${width}px';
    }
    if (height.runtimeType == String) element.style.height = height;
    if (height.runtimeType == int || height.runtimeType == double) {
      element.style.height = '${height}px';
    }
  }
}
