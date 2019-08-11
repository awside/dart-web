import 'dart:html';

import '../../widget.dart';

class Padding extends WidgetAttribute {
  final double left;
  final double top;
  final double right;
  final double bottom;

  Padding._(
    this.left,
    this.top,
    this.right,
    this.bottom,
  );

  static Padding all(double value) => Padding._(value, value, value, value);

  static Padding only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding._(left, top, right, bottom);

  static Padding LRTP(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      Padding._(left, top, right, bottom);

  @override
  applyToElement(Element element) {
    element.style
      ..paddingLeft = '${left}px'
      ..paddingTop = '${top}px'
      ..paddingRight = '${right}px'
      ..paddingBottom = '${bottom}px';
  }
}
