import '../../../anim/animated_double.dart';
import '../../../anim/animation_controller.dart';
import '../../../anim/curves.dart';
import '../../widget.dart';
import 'color.dart';

class Shadow {
  Widget widget;
  String _hexColor = 'transparent';
  Colors color;
  AnimatedDouble _animX;
  AnimatedDouble _animY;
  AnimatedDouble _animBlur;
  AnimatedDouble _animSpread;

  Shadow({
    double x,
    double y,
    double blur,
    double spread,
    Colors color,
  }) {
    this.color = color ?? Colors.black;
    _animX = AnimatedDouble(x ?? 0);
    _animY = AnimatedDouble(y ?? 0);
    _animBlur = AnimatedDouble(blur ?? 0);
    _animSpread = AnimatedDouble(spread ?? 0);
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style.boxShadow =
        '${_animX.value}px ${_animY.value}px ${_animBlur.value}px ${_animSpread.value}px ${_hexColor}';
    _listeners();
  }

  _listeners() {
    color.stream.listen((v) {
      _hexColor = v;
      widget.element.style.boxShadow =
          '${v}px ${_animY.value}px ${_animBlur.value}px ${_animSpread.value}px ${_hexColor}';
    });
    _animX.stream.listen((v) {
      widget.element.style.boxShadow =
          '${v}px ${_animY.value}px ${_animBlur.value}px ${_animSpread.value}px ${_hexColor}';
    });
    _animY.stream.listen((v) {
      widget.element.style.boxShadow =
          '${_animX.value}px ${v}px ${_animBlur.value}px ${_animSpread.value}px ${_hexColor}';
    });
    _animBlur.stream.listen((v) {
      widget.element.style.boxShadow =
          '${_animX.value}px ${_animY.value}px ${v}px ${_animSpread.value}px ${_hexColor}';
    });
    _animSpread.stream.listen((v) {
      widget.element.style.boxShadow =
          '${_animX.value}px ${_animY.value}px ${_animBlur.value}px ${v}px ${_hexColor}';
    });
  }

  set duration(double duration) {
    _animX.duration = duration;
    _animY.duration = duration;
    _animBlur.duration = duration;
    _animSpread.duration = duration;
  }

  // set curve(Curves curve) {
  //   _animX.curve = curve;
  //   _animY.curve = curve;
  //   _animBlur.curve = curve;
  //   _animSpread.curve = curve;
  // }

  get x => _animX.value;
  set x(double x) => _animX.value = x;

  get y => _animY.value;
  set y(double y) => _animY.value = y;

  get blur => _animBlur.value;
  set blur(double blur) => _animBlur.value = blur;

  get spread => _animSpread.value;
  set spread(double spread) => _animSpread.value = spread;
}
