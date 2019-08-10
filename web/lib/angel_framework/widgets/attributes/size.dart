import 'widget_attribute.dart';

class Size extends WidgetAttribute {
  final dynamic width;
  final dynamic height;

  Size({
    this.width,
    this.height,
  });

  @override
  applyToElement() {
    if (width.runtimeType == String) widget.element.style.width = width;
    if (width.runtimeType == int || width.runtimeType == double) {
      widget.element.style.width = '${width}px';
    }
    if (height.runtimeType == String) widget.element.style.height = height;
    if (height.runtimeType == int || height.runtimeType == double) {
      widget.element.style.height = '${height}px';
    }
  }
}
