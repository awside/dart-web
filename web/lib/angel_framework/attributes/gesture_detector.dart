import 'dart:html';

import 'widget_attribute.dart';

// enum GestureEvent { onTap }

class GestureDetector extends WidgetAttribute {
  final Element element;

  GestureDetector(this.element);

  GestureDetector onTap(Function(Event) fun) {
    element.addEventListener('click', fun);
    return this;
  }

  // create(Map<GestureEvent, Function(Event)> gesture) {
  //   gesture.forEach((k, v) {
  //     switch (k) {
  //       case GestureEvent.onTap:
  //         onTap(v);
  //         break;
  //     }
  //   });
  // }

  @override
  applyToElement(Element element) => null;
}
