import 'dart:html';

import 'package:nanoid/non_secure/nanoid.dart';

import '../extra/screen_width.dart';
import 'attributes/widget_attributes.dart';
export 'anime.dart';
export 'attributes/widget_attributes.dart';

abstract class Widget {
  String id;
  Widget parent;
  Element element;
  List<Widget> children;
  List<WidgetAttribute> widgetAttributes;

  Widget() {
    id = nanoid();
    var widget = build();
    if (widget != null) _transformTo(widget);
    ScreenWidthController.instance.stream.listen((screenType) {
      switch (screenType) {
        case ScreenType.phone:
          whenPhone();
          break;
        case ScreenType.tablet:
          whenTablet();
          break;
        case ScreenType.desktop:
          whenDesktop();
          break;
      }
    });
  }

  _transformTo(Widget widget) {
    id = widget.id;
    element = widget.element;
    children = widget.children;
    widgetAttributes = widget.widgetAttributes;
  }

  _reAttach() {
    for (var widgetAttr in widgetAttributes ?? []) {
      if (widgetAttr != null) apply(widgetAttr);
    }
    whenAttached();
    for (var child in children) {
      child.attach(this);
    }
  }

  Widget build();


  attach(Widget parent, {int at}) {
    this.parent = parent;
    at != null
        ? parent.element.children.insert(at, element)
        : parent.element.children.add(element);
    for (var widgetAttr in widgetAttributes ?? []) {
      if (widgetAttr != null) apply(widgetAttr);
    }
    whenAttached();
    for (var child in children) {
      child.attach(this);
    }
  }

  apply(WidgetAttribute widgetAttribute) {
    widgetAttribute.applyToElement(element);
    if (widgetAttribute is GestureDetector) {
      widgetAttribute.widget = this;
    }
  }

  Widget replaceWith(Widget widget) {
    var index = parent.element.children.indexOf(element);
    parent.element.children.remove(element);
    _transformTo(widget);
    parent.element.children.insert(index, element);
    _reAttach();
    return this;
  }

  whenAttached() {}

  whenPhone() {}

  whenTablet() {}

  whenDesktop() {}
}
