import 'dart:html';

import '../widget.dart';
import 'widget_attribute.dart';

class GestureDetector extends WidgetAttribute {
  Widget widget;
  Function(Event, Widget) onTap;

  GestureDetector({
    this.onTap,
  });

  _onTap(Event event) {
    onTap(event, widget);
  }

  @override
  applyToElement(Element element) {
    if (onTap != null) element.addEventListener('click', _onTap);
  }
}
