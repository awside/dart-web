import 'dart:html';

import 'package:hex/hex.dart';

import 'widget_attributes.dart';

class Colors extends WidgetAttribute {
  final String hexColor;
  final double alpha;

  const Colors._(this.hexColor, {this.alpha = 1});

  Colors(this.hexColor, {this.alpha = 1});

  String get color {
    var decodedColor = HEX.decode(hexColor.replaceAll('#', ''));
    return 'rgba(${decodedColor[0]}, ${decodedColor[1]}, ${decodedColor[2]}, ${alpha})';
  }

  @override
  applyToElement(Element element) => null;

  static const Colors transparent = Colors._('#ffffff', alpha: 0);
  static const Colors white = Colors._('#ffffff');
  static const Colors black = Colors._('#000000');
  static const Colors grey = Colors._('#808080');
  static const Colors red = Colors._('#ab5454');
  static const Colors blue = Colors._('#5488ab');
  static const Colors green = Colors._('#54ab60');
}
