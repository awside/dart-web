import '../../helper/animation_controller.dart';
import '../../helper/widget.dart';

class Size {
  Widget widget;
  double duration = 0;
  double __width;
  double __height;
  double __widthPercentage;
  double __heightPercentage;
  var _widthAnimationController = AnimationController();
  var _heightAnimationController = AnimationController();

  Size({
    double width,
    double height,
    double widthPercentage,
    double heightPercentage,
  })  : this.__width = width,
        this.__height = height,
        this.__widthPercentage = widthPercentage ?? 100,
        this.__heightPercentage = heightPercentage ?? 100;

  set _width(double width) {
    widget.element.style.width = '${__width}px';
  }

  set _height(double height) {
    widget.element.style.height = '${__height}px';
  }

  set _widthPercentage(double width) {
    widget.element.style.width = '${__widthPercentage}%';
  }

  set _heightPercentage(double height) {
    widget.element.style.height = '${__heightPercentage}%';
  }

  applyTo(Widget widget) {
    this.widget = widget;
    if (__width != null) {
      _width = __width;
    } else {
      _widthPercentage = __widthPercentage;
    }
    if (__height != null) {
      _height = __height;
    } else {
      _heightPercentage = __heightPercentage;
    }
  }

  set width(double width) {
    _widthAnimationController.animate(
      duration: duration,
      startValue: widget.element.offsetWidth.toDouble(),
      endValue: width,
      animation: (double value) {
        _width = value;
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
      },
    );
  }

  set heightPercentage(double height) {
    _heightAnimationController.animate(
      duration: duration,
      startValue: widget.element.offsetHeight /
          widget.element.parent.offsetHeight *
          100,
      endValue: height,
      animation: (double value) {
        _heightPercentage = value;
      },
    );
  }
}
