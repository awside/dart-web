import 'dart:html';

abstract class WidgetAttribute {
  const WidgetAttribute();

  applyToElement(Element element);
}
