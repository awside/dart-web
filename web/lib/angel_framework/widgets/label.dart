import 'dart:html';

import '../widget.dart';
import 'attributes/color.dart';
import 'attributes/font_weight.dart';

class Label extends Widget {
  String text;
  // Colors color;
  double fontSize;
  bool italic;
  FontWeight fontWeight;

  Label({
    this.text = '',
    // this.color,
    this.fontSize = 16,
    this.fontWeight,
    this.italic = false,
  }) : super(
          element: SpanElement(),
        );

  @override
  initialStyle() {
    // TODO: implement initialStyle
    return null;
  }

  // @override
  // render() {
  //   ref?.applyTo(this);
  //   text = text ?? '';
  //   fontSize = fontSize;
  //   italic = italic;

  //   element.style.color = color?.color ?? Colors.black.color;
    
  // }

  // set text(String value) => element.text = value;
  // set fontSize(double value) => element.style.fontSize = '${value}px';
  // set italic(bool value) => element.style.fontStyle = value ? 'italic' : '';
}
