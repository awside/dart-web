import '../../helper/animate.dart';
import '../../helper/widget.dart';

class MarginA {
  Widget widget;
  double duration = 0;
  double _left;
  double _top;
  double _right;
  double _bottom;
  var _leftAnimationController = AnimationController();
  var _topAnimationController = AnimationController();
  var _rightAnimationController = AnimationController();
  var _bottomAnimationController = AnimationController();

  MarginA.all(double value) {
    _left = value;
    _top = value;
    _right = value;
    _bottom = value;
  }

  MarginA.LTRB(
    double left,
    double top,
    double right,
    double bottom,
  )   : this._left = left,
        this._top = top,
        this._right = right,
        this._bottom = bottom;

  MarginA.only({
    double left,
    double top,
    double right,
    double bottom,
  }) {
    this._left = left ?? 0;
    this._top = top ?? 0;
    this._right = right ?? 0;
    this._bottom = bottom ?? 0;
  }

  set left(double left) {
    _leftAnimationController.animate(
      duration: duration,
      startValue: this._left,
      endValue: left,
      animation: (double value) {
        _left = value;
        widget.element.style.marginLeft = '${_left}px';
      },
    );
  }

  set top(double top) {
    _topAnimationController.animate(
      duration: duration,
      startValue: this._top,
      endValue: top,
      animation: (double value) {
        _top = value;
        widget.element.style.marginTop = '${_top}px';
      },
    );
  }

  set right(double right) {
    _rightAnimationController.animate(
      duration: duration,
      startValue: this._right,
      endValue: right,
      animation: (double value) {
        _right = value;
        widget.element.style.marginRight = '${_right}px';
      },
    );
  }

  set bottom(double bottom) {
    _bottomAnimationController.animate(
      duration: duration,
      startValue: this._bottom,
      endValue: bottom,
      animation: (double value) {
        _bottom = value;
        widget.element.style.marginBottom = '${_bottom}px';
      },
    );
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style
      ..marginLeft = '${_left}px'
      ..marginTop = '${_top}px'
      ..marginRight = '${_right}px'
      ..marginBottom = '${_bottom}px';
  }
}
