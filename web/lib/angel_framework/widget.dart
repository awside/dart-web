import 'dart:html';

import 'anime.dart';
import 'attributes/widget_attributes.dart';
import 'widget_base.dart';

export 'anime.dart';
export 'attributes/widget_attributes.dart';

abstract class Widget extends WidgetBase {
  Element parentElement;
  Element element;
  Widget child;
  List<Widget> children;
  List<WidgetAttribute> widgetAttributes = [];
  Anim startAnimation;
  Anim endAnimation;

  Widget({
    this.element,
    this.child,
    this.children,
  });

  activate(Element parentElement) {
    this.parentElement = parentElement;
    parentElement.children.add(element);
    for (var widgetAttr in widgetAttributes) {
      if (widgetAttr != null) apply(widgetAttr);
    }
    if (startAnimation != null) {
      startAnimation.addAnimationData({
        'targets': element,
      });
      startAnimation.start();
    }
    child?.activate(element);
    children?.forEach((child) => child.activate(element));
  }

  remove() {
    if (endAnimation != null) {
      endAnimation.addAnimationData({
        'targets': element,
        'complete': () => parentElement.children.remove(element),
      });
      endAnimation.start();
    } else {
      parentElement.children.remove(element);
    }
  }

  apply(WidgetAttribute widgetAttribute) {
    widgetAttribute.applyToElement(element);
  }
}
