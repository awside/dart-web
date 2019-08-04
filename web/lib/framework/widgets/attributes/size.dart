import '../../helper/animate.dart';
import '../../helper/widget.dart';

class SizeA {
  Widget widget;
  double duration = 0;
  double _width;
  double _height;
  double _widthPercentage;
  double _heightPercentage;
  var _widthAnimationController = AnimationController();
  var _heightAnimationController = AnimationController();

  SizeA({
    double width,
    double height,
    double widthPercentage,
    double heightPercentage,
  })  : this._width = width,
        this._height = height,
        this._widthPercentage = widthPercentage ?? 100,
        this._heightPercentage = heightPercentage ?? 100;

  set width(double width) {
    _widthAnimationController.animate(
      duration: duration,
      startValue: widget.element.offsetWidth.toDouble(),
      endValue: width,
      animation: (double value) {
        _width = value;
        widget.element.style.width = '${_width}px';
      },
    );
  }

  set height(double height) {
    _heightAnimationController.animate(
      duration: duration,
      startValue: widget.element.offsetHeight.toDouble(),
      endValue: height,
      animation: (double value) {
        _height = value;
        widget.element.style.height = '${_height}px';
      },
    );
  }

  set widthPercentage(double width) {
    _widthAnimationController.animate(
      duration: duration,
      startValue:
          widget.element.offsetWidth / widget.element.parent.offsetWidth * 100,
      endValue: width,
      animation: (double value) {
        _widthPercentage = value;
        widget.element.style.width = '${_widthPercentage}%';
      },
    );
  }

  set heightPercentage(double height) {
    _heightAnimationController.animate(
      duration: duration,
      startValue:
          widget.element.offsetHeight / widget.element.parent.offsetHeight * 100,
      endValue: height,
      animation: (double value) {
        _heightPercentage = value;
        widget.element.style.height = '${_heightPercentage}%';
      },
    );
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style
      ..width = _width != null ? '${_width}px' : '${_widthPercentage}%'
      ..height = _height != null ? '${_height}px' : '${_heightPercentage}%';
  }
}
