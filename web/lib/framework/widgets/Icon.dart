import 'dart:svg';

import 'package:meta/meta.dart';

import '../helper/widget.dart';
import 'attributes/color.dart';
import 'attributes/size.dart';

class Icon extends Widget {
  WidgetRef _ref;
  SvgElement _icon;
  Colors color;

  Icon({
    WidgetRef ref,
    SvgElement icon,
    this.color,
  }) : super(element: Typicons.home) {
    _ref = ref;
    _icon = icon;
  }

  @override
  render() {
    element.style
      ..width = '100%'
      ..height = '100%';
    _ref?.applyTo(this);
    if (_icon != null) element = _icon;
    color ??= Colors.black;
    color.stream.listen((v) => (element as SvgElement).attributes['fill'] = v);
  }

  set icon(SvgElement value) {
    var parent = element.parent;
    element.remove();
    element = value;
    parent.children.add(element);
    render();
  }
}

class Typicons {
  static final home = SvgElement.svg(
      '''<svg version="1.2" baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
      <path d="M12 3s-6.186 5.34-9.643 8.232c-.203.184-.357.452-.357.768 0 .553.447 1 1 1h2v7c0 .553.447 1 1 1h3c.553 0 1-.448 1-1v-4h4v4c0 .552.447 1 1 1h3c.553 0 1-.447 1-1v-7h2c.553 0 1-.447 1-1 0-.316-.154-.584-.383-.768-3.433-2.892-9.617-8.232-9.617-8.232z"/>
      </svg>''');

  static final user = SvgElement.svg(
      '''<svg version="1.2" baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
      <path d="M17 9c0-1.381-.56-2.631-1.464-3.535-.905-.905-2.155-1.465-3.536-1.465s-2.631.56-3.536 1.465c-.904.904-1.464 2.154-1.464 3.535s.56 2.631 1.464 3.535c.905.905 2.155 1.465 3.536 1.465s2.631-.56 3.536-1.465c.904-.904 1.464-2.154 1.464-3.535zM6 19c0 1 2.25 2 6 2 3.518 0 6-1 6-2 0-2-2.354-4-6-4-3.75 0-6 2-6 4z"/>
      </svg>''');

  static final book = SvgElement.svg(
      '''<svg version="1.2" baseProfile="tiny" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
      <path d="M18 3h-11c-.265 0-.52.105-.707.293l-3 3-.057.062c-.139.165-.225.373-.235.6l-.001.053v10.992c0 1.654 1.346 3 3 3h9c1.304 0 2.416-.836 2.829-2h.671c1.402 0 2.5-1.317 2.5-3v-10c0-1.654-1.346-3-3-3zm-12 16c-.551 0-1-.448-1-1v-10h2v11h-1zm10-1c0 .552-.449 1-1 1h-7v-11h7c.551 0 1 .448 1 1v9zm3-2c0 .62-.324 1-.5 1h-.5v-8c0-1.654-1.346-3-3-3h-8.586l1-1h10.586c.551 0 1 .448 1 1v10z"/>
      </svg>''');
}
