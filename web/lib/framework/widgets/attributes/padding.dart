import '../../helper/animated_double.dart';
import '../../helper/animation_controller.dart';
import '../../helper/widget.dart';

class Padding {
  Widget widget;
  AnimatedDouble _animLeft;
  AnimatedDouble _animTop;
  AnimatedDouble _animRight;
  AnimatedDouble _animBottom;

  Padding() {
    _animLeft = AnimatedDouble(0);
    _animTop = AnimatedDouble(0);
    _animRight = AnimatedDouble(0);
    _animBottom = AnimatedDouble(0);
    _listeners();
  }

  Padding.all(double value) {
    _animLeft = AnimatedDouble(value);
    _animTop = AnimatedDouble(value);
    _animRight = AnimatedDouble(value);
    _animBottom = AnimatedDouble(value);
    _listeners();
  }

  Padding.LTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    _animLeft = AnimatedDouble(left);
    _animTop = AnimatedDouble(top);
    _animRight = AnimatedDouble(right);
    _animBottom = AnimatedDouble(left);
    _listeners();
  }

  Padding.only({
    double left,
    double top,
    double right,
    double bottom,
  }) {
    _animLeft = AnimatedDouble(left ?? 0);
    _animTop = AnimatedDouble(top ?? 0);
    _animRight = AnimatedDouble(right ?? 0);
    _animBottom = AnimatedDouble(left ?? 0);
    _listeners();
  }

  _listeners() {
    _animLeft.stream.listen((v) {
      widget.element.style.paddingLeft = '${v}px';
    });
    _animTop.stream.listen((v) {
      widget.element.style.paddingTop = '${v}px';
    });
    _animRight.stream.listen((v) {
      widget.element.style.paddingRight = '${v}px';
    });
    _animBottom.stream.listen((v) {
      widget.element.style.paddingBottom = '${v}px';
    });
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style
      ..paddingLeft = '${_animLeft.value}px'
      ..paddingTop = '${_animTop.value}px'
      ..paddingRight = '${_animRight.value}px'
      ..paddingBottom = '${_animBottom.value}px';
  }

  set duration(double duration) {
    _animLeft.duration = duration;
    _animTop.duration = duration;
    _animRight.duration = duration;
    _animBottom.duration = duration;
  }

  set curve(Curves curve) {
    _animLeft.curve = curve;
    _animTop.curve = curve;
    _animRight.curve = curve;
    _animBottom.curve = curve;
  }

  get left => _animLeft.value;
  set left(double left) => _animLeft.value = left;

  get top => _animLeft.value;
  set top(double top) => _animTop.value = top;

  get right => _animLeft.value;
  set right(double right) => _animRight.value = right;

  get bottom => _animLeft.value;
  set bottom(double bottom) => _animBottom.value = bottom;

  set all(double value) {
    left = value;
    top = value;
    right = value;
    bottom = value;
  }
}
