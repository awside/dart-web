import 'dart:html';

import '../../widget.dart';

class Size extends WidgetAttribute {
  final dynamic width;
  final dynamic height;

  const Size({
    this.width,
    this.height,
  });

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
