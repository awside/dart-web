import '../../helper/animation_controller.dart';
import '../../helper/animated_double.dart';
import '../../helper/widget.dart';

class Position {
  Widget widget;
  AnimatedDouble _animX;
  AnimatedDouble _animY;

  Position({
    double x,
    double y,
  }) {
    _animX = AnimatedDouble(x ?? 0);
    _animY = AnimatedDouble(y ?? 0);
    duration = 0;
    _animX.stream.listen((v) {
      widget.element.style.transform = 'translateX(${_animX.value}px)';
    });
    _animY.stream.listen((v) {
      widget.element.style.transform = 'translateY(${_animY.value}px)';
    });
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style.transform =
        'translate(${_animX.value}px, ${_animY.value}px)';
  }

  set duration(double duration) {
    _animX.duration = duration;
    _animY.duration = duration;
  }

  set curve(Curves curve) {
    _animX.curve = curve;
    _animY.curve = curve;
  }

  get x => _animX.value;
  set x(double x) => _animX.value = x;
  get y => _animY.value;
  set y(double y) => _animY.value = y;
}
