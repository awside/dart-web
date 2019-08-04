import 'dart:html';

import 'package:meta/meta.dart';
import "package:hex/hex.dart";

import 'animation_controller.dart';

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

class Colors {
  int _red;
  int _green;
  int _blue;
  double _alpha;
  var _alphaAnimationController = AnimationController();

  Colors._(String color, {double alpha}) {
    _alpha = alpha ?? 1;
    var decodedColor = HEX.decode(color.replaceAll('#', ''));
    _red = decodedColor[0];
    _green = decodedColor[1];
    _blue = decodedColor[2];
  }

  String get color => 'rgba(${_red}, ${_green}, ${_blue}, ${_alpha})';

  alpha(double a) {
    _alpha = a;
    _alphaAnimationController.stop();
    return this;
  }

  animateAlpha(
      {@required double alpha,
      @required double duration,
      @required Function() callback}) {
    _alphaAnimationController.animate(
      duration: duration,
      startValue: this._alpha,
      endValue: alpha,
      animation: (double value) {
        _alpha = value;
        callback();
      },
    );
  }

  static Colors get transparent => Colors._('#ffffff', alpha: 0);
  static Colors get white => Colors._('#ffffff');
  static Colors get black => Colors._('#000000');
  static Colors get grey => Colors._('#808080');
  static Colors get red => Colors._('#ab5454');
  static Colors get blue => Colors._('#5488ab');
  static Colors get green => Colors._('#54ab60');
}
