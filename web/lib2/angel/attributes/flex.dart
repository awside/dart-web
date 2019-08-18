import 'dart:html';

import 'widget_attribute.dart';

enum FlexPosition { start, center, end }

class Flex extends WidgetAttribute {
  int flex;
  FlexPosition horizontal;
  FlexPosition vertical;

  Flex({
    this.flex,
    this.horizontal,
    this.vertical,
    bool center = false,
  }) {
    if (center) {
      horizontal = FlexPosition.center;
      vertical = FlexPosition.center;
    }
  }

  @override
  applyToElement(Element element) {
    element.style
      ..flex = flex.toString()
      ..justifyContent = getFlexPositionString(horizontal)
      ..alignItems = getFlexPositionString(vertical);
  }

  String getFlexPositionString(FlexPosition value) {
    switch (value) {
      case FlexPosition.start:
        return 'flex-start';
      case FlexPosition.center:
        return 'center';
      case FlexPosition.end:
        return 'flex-end';
      default:
        return null;
    }
  }
}
