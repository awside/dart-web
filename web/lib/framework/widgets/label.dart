import 'dart:html';

import '../helper/widget.dart';

class Label extends Widget {
  String text;
  WidgetRef ref;
  String color;
  double fontSize;
  bool italic;
  FontWeight fontWeight;

  Label(
    this.text, {
    this.ref,
    this.color,
    this.fontSize,
    this.italic = false,
    this.fontWeight,
  }) : super(
          element: SpanElement(),
        ) {
    element.text = text;
    element.style
      ..fontSize = '${fontSize}px'
      ..fontStyle = italic ? 'italic' : ''
      ..color = color;
  }

  @override
  render() {
    ref?.applyTo(this);
    fontWeight?.applyTo(this);
  }
}
