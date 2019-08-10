import '../../widget.dart';
import 'widget_attributes.dart';

class Padding extends WidgetAttribute {
  Widget widget;
  double left;
  double top;
  double right;
  double bottom;

  Padding.all(double value) {
    left = value;
    top = value;
    right = value;
    bottom = value;
  }

  Padding.LTRB(
    this.left,
    this.top,
    this.right,
    this.bottom,
  );

  Padding.only(
    this.left,
    this.top,
    this.right,
    this.bottom,
  );

  @override
  applyToElement() {
    widget.element.style
      ..paddingLeft = '${left}px'
      ..paddingTop = '${top}px'
      ..paddingRight = '${right}px'
      ..paddingBottom = '${bottom}px';
  }
}
