import '../../../anim/animated_double.dart';
import '../../../anim/curves.dart';
import '../../widget.dart';
import 'color.dart';

class Border {
  Widget widget;
  AnimatedDouble _animWidth;
  AnimatedDouble _animRadius;
  Colors color;
  String style;

  Border({
    double width,
    double radius,
    Colors color,
    String style,
  }) {
    _animWidth = AnimatedDouble(width ?? 0);
    _animRadius = AnimatedDouble(radius ?? 0);
    this.color = color ?? Colors.black;
    this.style = style ?? 'solid';
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style
      ..borderWidth = '${_animWidth.value}px'
      ..borderStyle = style
      ..borderRadius = '${_animRadius.value}px';
    _listeners();
  }

  _listeners() {
    color.stream.listen((v) {
      widget.element.style.borderColor = v;
    });
    _animWidth.stream.listen((v) {
      widget.element.style.borderWidth = '${v}px';
    });
    _animRadius.stream.listen((v) {
      widget.element.style.borderRadius = '${v}px';
    });
  }

  set duration(double duration) {
    _animWidth.duration = duration;
    _animRadius.duration = duration;
  }

  // set curve(Curves curve) {
  //   _animWidth.curve = curve;
  //   _animRadius.curve = curve;
  // }

  get width => _animWidth.value;
  set width(double width) => _animWidth.value = width;

  get radius => _animRadius.value;
  set radius(double radius) => _animRadius.value = radius;
}
