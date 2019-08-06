import '../../helper/widget.dart';

enum FWeight {
  light,
  normal,
  bold,
}

class FontWeight {
  Widget _widget;
  FWeight _weight;

  FontWeight._(FWeight fontWeight) {
    _weight = fontWeight;
  }

  applyTo(Widget widget) {
    _widget = widget;
    this.weight = _weight;
  }

  set weight(FWeight value) {
    _widget.element.style.fontWeight = getStringFromWeight(value);
  }

  String getStringFromWeight(FWeight fontWeight) {
    switch (fontWeight) {
      case FWeight.light:
        return '300';
        break;
      case FWeight.normal:
        return '400';
        break;
      case FWeight.bold:
        return '700';
        break;
    }
    return null;
  }

  static FontWeight light = FontWeight._(FWeight.light);
  static FontWeight normal = FontWeight._(FWeight.normal);
  static FontWeight bold = FontWeight._(FWeight.bold);
}
