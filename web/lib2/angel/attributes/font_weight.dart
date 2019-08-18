import 'dart:html';

import 'widget_attribute.dart';

enum FWeight {
  light,
  normal,
  bold,
}

class FontWeight extends WidgetAttribute {
  FWeight weight;

  FontWeight._(this.weight);

  String getStringFromWeight(FWeight fontWeight) {
    switch (fontWeight) {
      case FWeight.light:
        return '300';
      case FWeight.normal:
        return '400';
      case FWeight.bold:
        return '700';
      default:
        return '400';
    }
  }

  @override
  applyToElement(Element element) {
    element.style.fontWeight = getStringFromWeight(weight);
  }

  static FontWeight light = FontWeight._(FWeight.light);
  static FontWeight normal = FontWeight._(FWeight.normal);
  static FontWeight bold = FontWeight._(FWeight.bold);
}
