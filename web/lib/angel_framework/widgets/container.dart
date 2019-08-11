import 'dart:html';

import '../widget.dart';
import 'attributes/widget_attributes.dart';

class Container extends Widget {
  WidgetRef ref;
  Widget child;
  GestureDetector gestureDetector;
  final List<WidgetAttribute> widgetAttributeList = [];

  Container({
    this.ref,
    this.child,
    this.gestureDetector,
    Colors color,
    Flex flex,
    Size size,
    Padding padding,
    Shadow shadow,
    Border border,
  }) : super(
          element: DivElement(),
          child: child,
        ) {
    if (color != null) widgetAttributeList.add(color);
    if (flex != null) widgetAttributeList.add(flex);
    if (size != null) widgetAttributeList.add(size);
    if (padding != null) widgetAttributeList.add(padding);
    if (shadow != null) widgetAttributeList.add(shadow);
    if (border != null) widgetAttributeList.add(border);
  }

  @override
  render() {
    element.style
      ..display = 'flex'
      ..overflow = 'hidden'
      ..boxSizing = 'border-box';
    ref?.applyTo(this);

    for (var widgetAttribute in widgetAttributeList) {
      widgetAttribute.applyTo(this);
      if (widgetAttribute is Colors) {
        element.style.background = widgetAttribute.color;
      }
    }
  }
}
