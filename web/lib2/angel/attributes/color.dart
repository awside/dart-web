import 'dart:html';

import 'package:hex/hex.dart';

import 'widget_attributes.dart';

class Colors extends WidgetAttribute {
  String _hexColor;
  double _alpha;

  Colors._(this._hexColor, this._alpha);

  Colors(this._hexColor, this._alpha);

  String get color {
    var decodedColor = HEX.decode(_hexColor.replaceAll('#', ''));
    return 'rgba(${decodedColor[0]}, ${decodedColor[1]}, ${decodedColor[2]}, ${_alpha})';
  }

  alpha(double alpha) {
    this._alpha = alpha;
  }

  @override
  applyToElement(Element element) => null;

  static Colors get transparent => Colors._('#ffffff', 0);
  static Colors get white => Colors._('#ffffff', 1);
  static Colors get black => Colors._('#000000', 1);
  static Colors get grey => Colors._('#808080', 1);
  static Colors get red => Colors._('#ab5454', 1);
  static Colors get blue => Colors._('#5488ab', 1);
  static Colors get green => Colors._('#54ab60', 1);
}
