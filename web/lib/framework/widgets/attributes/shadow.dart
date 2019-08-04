import '../../helper/animation_controller.dart';
import '../../helper/widget.dart';

class Shadow {
  Widget widget;
  double duration = 0;
  double _x;
  double _y;
  double _blur;
  double _spread;
  Colors _color;
  var _xAnimationController = AnimationController();
  var _yAnimationController = AnimationController();
  var _blurAnimationController = AnimationController();
  var _spreadAnimationController = AnimationController();

  Shadow({
    double x,
    double y,
    double blur,
    double spread,
    Colors color,
  }) {
    this._x = x ?? 0;
    this._y = y ?? 0;
    this._blur = blur ?? 0;
    this._spread = spread ?? 0;
    this._color = color ?? Colors.black;
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style.boxShadow =
        '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
  }

  set x(double x) {
    if (duration == 0) {
      _xAnimationController.stop();
      _x = x;
      widget.element.style.boxShadow =
          '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      return;
    }
    _xAnimationController.animate(
      duration: duration,
      startValue: this._x,
      endValue: x,
      animation: (double value) {
        _x = value;
        widget.element.style.boxShadow =
            '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      },
    );
  }

  set y(double y) {
    if (duration == 0) {
      _yAnimationController.stop();
      _y = y;
      widget.element.style.boxShadow =
          '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      return;
    }
    _yAnimationController.animate(
      duration: duration,
      startValue: this._y,
      endValue: y,
      animation: (double value) {
        _y = value;
        widget.element.style.boxShadow =
            '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      },
    );
  }

  set blur(double blur) {
    if (duration == 0) {
      _blurAnimationController.stop();
      _blur = blur;
      widget.element.style.boxShadow =
          '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      return;
    }
    _blurAnimationController.animate(
      duration: duration,
      startValue: this._blur,
      endValue: blur,
      animation: (double value) {
        _blur = value;
        widget.element.style.boxShadow =
            '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      },
    );
  }

  set spread(double spread) {
    if (duration == 0) {
      _spreadAnimationController.stop();
      _spread = spread;

      widget.element.style.boxShadow =
          '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      return;
    }
    _spreadAnimationController.animate(
      duration: duration,
      startValue: this._spread,
      endValue: spread,
      animation: (double value) {
        _spread = value;
        widget.element.style.boxShadow =
            '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      },
    );
  }

  set alpha(double alpha) {
    if (duration == 0) {
      _color.alpha(alpha);
      widget.element.style.boxShadow =
          '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      return;
    }
    _color.animateAlpha(
      alpha: alpha,
      duration: duration,
      callback: () {
        widget.element.style.boxShadow =
            '${_x}px ${_y}px ${_blur}px ${_spread}px ${_color.color}';
      },
    );
  }
}
