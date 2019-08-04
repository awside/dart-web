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

class Flex {
  final String display;
  final int flex;
  final String horizontalAlign;
  final String verticalAlign;

  Flex({
    this.display,
    this.flex,
    this.horizontalAlign,
    this.verticalAlign,
  });

  applyTo(Widget widget) {
    widget.element.style
      ..display = display ?? 'flex'
      ..flex = flex?.toString() ?? '1'
      ..justifyContent = horizontalAlign
      ..alignItems = verticalAlign;
  }
}



class Border {
  Colors color;
  double width;
  String style;
  double radius;

  Border({this.color, this.width = 1, this.style = 'solid', this.radius});

  applyTo(Widget widget) {
    widget.element.style
      ..borderColor = color?.color ?? Colors.black.color
      ..borderWidth = '${width}px'
      ..borderStyle = style
      ..borderRadius = '${radius}px';
  }
}

class Shadow {
  double x;
  double y;
  double blur;
  double spread;
  Colors color;

  Shadow({
    this.x = 0,
    this.y = 0,
    this.blur = 0,
    this.spread = 0,
    this.color,
  });

  applyTo(Widget widget) {
    widget.element.style.boxShadow =
        '${x}px ${y}px ${blur}px ${spread}px ${color?.color ?? Colors.black.color}';
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

class Colors {
  final String color;

  const Colors(this.color);
  const Colors._(this.color);

  static const transparent = Colors._('transparent');
  static const white = Colors._('#ffffff');
  static const black = Colors._('#000000');
  static const grey = Colors._('#808080');
  static const red = Colors._('#ab5454');
  static const blue = Colors._('#5488ab');
  static const green = Colors._('#54ab60');
}
