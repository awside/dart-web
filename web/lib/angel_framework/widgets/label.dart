import 'dart:html';

import '../widget.dart';
import 'attributes/color.dart';
import 'attributes/font_weight.dart';

class Label extends Widget {
  WidgetRef ref;
  String _text;
  Colors color;
  double _fontSize;
  bool _italic;
  FontWeight fontWeight;

  Label({
    this.ref,
    String text,
    this.color,
    double fontSize,
    bool italic,
    this.fontWeight,
  }) : super(
          element: SpanElement(),
        ) {
    this._text = text;
    this._fontSize = fontSize;
    this._italic = italic;
  }

  @override
  render() {
    ref?.applyTo(this);
    this.text = _text ?? '';
    this.fontSize = _fontSize ?? 16;
    this.italic = _italic ?? false;
    color ??= Colors.black;
    (fontWeight ??= FontWeight.normal).applyTo(this);
    _listeners();
  }

  _listeners() {
    color.stream.listen((v) {
      element.style.color = v;
    });
  }

  set text(String value) => element.text = value;
  set fontSize(double value) => element.style.fontSize = '${value}px';
  set italic(bool value) => element.style.fontStyle = value ? 'italic' : '';
}
