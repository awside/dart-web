import 'dart:html';

import 'package:meta/meta.dart';

class Widget {
  Element element;
  Widget child;
  List<Widget> children;

  Widget({@required this.element, Widget child, List<Widget> children}) {
    if (child != null) {
      this.child = child;
      element.children.add(child.element);
    }
    if (children != null) {
      this.children = children;
      element.children.addAll(children.map((v) => v.element).toList());
    }
  }

  renderChildren() {
    if (child != null) {
      child.render();
      child.renderChildren();
    } else if (children != null) {
      for (var child in children) {
        child.render();
        child.renderChildren();
      }
    }
  }

  render() {}
}

class WidgetRef<T> {
  T widget;

  applyTo(Widget widget) {
    return this.widget = widget as T;
  }
}

class GestureDetector {
  final Function(Event) onTap;

  GestureDetector({this.onTap});

  applyTo(Widget widget) {
    if (onTap != null) widget.element.addEventListener('click', onTap);
  }
}

