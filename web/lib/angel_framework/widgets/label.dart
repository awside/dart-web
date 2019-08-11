import 'dart:html';

import '../widget.dart';

class Label extends Widget {
  Label({
    Label ref,
    String text,
    Colors color,
    double fontSize,
    FontWeight fontWeight,
    bool italic,
  }) : super(element: SpanElement(), widgetAttributeList: [
          color ?? Colors.black,
          fontWeight ?? FontWeight.normal,
        ]) {
    ref = this;
    this.text = text ?? '';
    this.fontSize = fontSize ?? 16;
    this.italic = italic ?? false;
  }

  @override
  initialStyle() {}

  @override
  color(Colors color) {
    element.style.color = color.color;
  }

  set text(String value) => element.text = value;
  set fontSize(double value) => element.style.fontSize = '${value}px';
  set italic(bool value) => element.style.fontStyle = value ? 'italic' : '';
}
