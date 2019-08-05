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

class FontWeight {
  final int index;

  const FontWeight._(this.index);

  static const FontWeight w300 = FontWeight._(2);
  static const FontWeight w400 = FontWeight._(3);
  static const FontWeight w700 = FontWeight._(6);
  static const FontWeight light = w300;
  static const FontWeight normal = w400;
  static const FontWeight bold = w700;

  String _getValue() {
    return const <int, String>{
      2: '300',
      3: '400',
      6: '700',
    }[index];
  }

  applyTo(Widget widget) {
    return widget.element.style.fontWeight = _getValue();
  }
}

class GestureDetector {
  final Function(Event) onTap;

  GestureDetector({this.onTap});

  applyTo(Widget widget) {
    if (onTap != null) widget.element.addEventListener('click', onTap);
  }
}

