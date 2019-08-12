import 'dart:html';

import '../widget.dart';

enum FlexPosition { start, center, end }

class Flex extends WidgetAttribute {
  final int flex;
  final FlexPosition horizontal;
  final FlexPosition vertical;

  Flex({
    this.flex,
    this.horizontal,
    this.vertical,
  });

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
