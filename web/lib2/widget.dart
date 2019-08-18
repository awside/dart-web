import 'dart:html';

abstract class Widget {
  Element parent;
  Element element;

  Widget(this.element);

  attach(Element parent) {
    this.parent = parent;
  }

  remove() {
    parent?.children?.remove(element);
  }

  apply() {}
}
