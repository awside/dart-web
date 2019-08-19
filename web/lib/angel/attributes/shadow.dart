import 'dart:html';

import 'color.dart';
import 'widget_attribute.dart';

class Shadow extends WidgetAttribute {
  final Colors color;
  final double x;
  final double y;
  final double blur;
  final double spread;

  Shadow({
    this.color,
    this.x = 0,
    this.y = 0,
    this.blur = 0,
    this.spread = 0,
  });

  @override
  applyToElement(Element element) {
    element.style.boxShadow =
        '${x}px ${y}px ${blur}px ${spread}px ${color?.color ?? Colors.black.color}';
  }
}
