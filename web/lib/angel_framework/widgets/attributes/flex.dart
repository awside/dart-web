import '../../widget.dart';

enum FlexPosition { start, center, end }

class Flex {
  Widget widget;
  FlexPosition _horizontal;
  FlexPosition _vertical;

  Flex({
    FlexPosition horizontal = FlexPosition.start,
    FlexPosition vertical = FlexPosition.start,
  }) {
    _horizontal = horizontal;
    _vertical = vertical;
  }

  applyTo(Widget widget) {
    this.widget = widget;
    this.horizontal = _horizontal;
    this.vertical = _vertical;
  }

  set horizontal(FlexPosition flexPosition) =>
      widget.element.style.justifyContent = getFlexPositionString(flexPosition);
  set vertical(FlexPosition flexPosition) =>
      widget.element.style.alignItems = getFlexPositionString(flexPosition);

  String getFlexPositionString(FlexPosition value) {
    switch (value) {
      case FlexPosition.start:
        return 'flex-start';
        break;
      case FlexPosition.center:
        return 'center';
        break;
      case FlexPosition.end:
        return 'flex-end';
        break;
    }
    return null;
  }
}
