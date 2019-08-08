import 'dart:html';

import 'package:meta/meta.dart';

import 'anim_value.dart';

class Anim {
  final Element element;
  final double width;
  AnimValue animValue;

  Anim({
    @required this.element,
    this.width,
  }) {
    print(element.offsetWidth);
    // if (width != null) {
    //   animValue = AnimValue(startValue: element.offsetWidth, endValue: this.width);
    // }
  }
}
