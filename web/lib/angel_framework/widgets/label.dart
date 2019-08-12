import 'dart:html';

import '../widget.dart';

class Label extends Widget {
  Label({
    String text,
    Colors color,
    double fontSize,
    FontWeight fontWeight,
    bool italic,
  }) : super(element: SpanElement()) {
    text = text ?? '';
    fontSize = fontSize ?? 16;
    italic = italic ?? false;
    element.style.color = color?.color ?? Colors.black.color;
    fontWeight?.applyToElement(element);
  }

  set text(String value) => element.text = value;
  set fontSize(double value) => element.style.fontSize = '${value}px';
  set italic(bool value) => element.style.fontStyle = value ? 'italic' : '';
}
