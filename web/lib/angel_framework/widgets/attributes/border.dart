import '../../widget.dart';
import 'color.dart';
import 'widget_attribute.dart';

enum BorderStyle { solid, dotted, dashed }

class Border extends WidgetAttribute {
  Widget widget;
  final double width;
  final double radius;
  final BorderStyle style;
  final Colors color;

  Border({
    this.width = 1,
    this.radius = 0,
    this.style = BorderStyle.solid,
    this.color,
  });

  @override
  applyToElement() {
    widget.element.style
      ..borderWidth = '${width}px'
      ..borderStyle = style.toString().split('.')[1]
      ..borderRadius = '${radius}px'
      ..borderColor = color?.color ?? Colors.black.color;
  }
}
