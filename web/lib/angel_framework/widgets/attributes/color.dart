import 'package:hex/hex.dart';

import 'widget_attributes.dart';

class Colors extends WidgetAttribute {
  String color;

  Colors(String hexColor, {double alpha}) {
    var decodedColor = HEX.decode(hexColor.replaceAll('#', ''));
    color =
        'rgba(${decodedColor[0]}, ${decodedColor[1]}, ${decodedColor[2]}, ${alpha ?? 1})';
  }

  @override
  applyToElement() => null;

  static Colors get transparent => Colors('#ffffff', alpha: 0);
  static Colors get white => Colors('#ffffff');
  static Colors get black => Colors('#000000');
  static Colors get grey => Colors('#808080');
  static Colors get red => Colors('#ab5454');
  static Colors get blue => Colors('#5488ab');
  static Colors get green => Colors('#54ab60');
}
