import 'package:hex/hex.dart';

import 'widget_attributes.dart';

class Colors extends WidgetAttribute {
  final String hexColor;
  final double alpha;

  Colors._(this.hexColor, {this.alpha = 1});

  String get color {
    var decodedColor = HEX.decode(hexColor.replaceAll('#', ''));
    return 'rgba(${decodedColor[0]}, ${decodedColor[1]}, ${decodedColor[2]}, ${alpha})';
  }

  @override
  applyToElement() => null;

  static Colors get transparent => Colors._('#ffffff', alpha: 0);
  static Colors get white => Colors._('#ffffff');
  static Colors get black => Colors._('#000000');
  static Colors get grey => Colors._('#808080');
  static Colors get red => Colors._('#ab5454');
  static Colors get blue => Colors._('#5488ab');
  static Colors get green => Colors._('#54ab60');
}
