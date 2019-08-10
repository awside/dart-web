import '../../../anim/animated_double.dart';
import '../../widget.dart';

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
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style.transform =
        'translate(${_animX.value}px, ${_animY.value}px)';
  }
}
