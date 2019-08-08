

import '../../../anim/animated_double.dart';
import '../../../anim/curves.dart';
import '../../widget.dart';

class Size {
  Widget widget;
  AnimatedDouble _animWidth;
  AnimatedDouble _animHeight;
  AnimatedDouble _animWidthPercentage;
  AnimatedDouble _animHeightPercentage;

  Size({
    double width,
    double height,
    double widthPercentage,
    double heightPercentage,
  }) {
    _animWidth = AnimatedDouble(width);
    _animHeight = AnimatedDouble(height);
    _animWidthPercentage = AnimatedDouble(widthPercentage ?? 100);
    _animHeightPercentage = AnimatedDouble(heightPercentage ?? 100);
  }

  applyTo(Widget widget) {
    this.widget = widget;
    if (_animWidth.value != null) {
      widget.element.style.width = '${_animWidth.value}px';
    } else {
      widget.element.style.width = '${_animWidthPercentage.value}%';
    }
    if (_animHeight.value != null) {
      widget.element.style.height = '${_animHeight.value}px';
    } else {
      widget.element.style.height = '${_animHeightPercentage.value}%';
    }
    _listeners();
  }

  _listeners() {
    _animWidth.stream.listen((v) {
      widget.element.style.width = '${v}px';
    });
    _animHeight.stream.listen((v) {
      widget.element.style.height = '${v}px';
    });
    _animWidthPercentage.stream.listen((v) {
      widget.element.style.width = '${v}%';
    });
    _animHeightPercentage.stream.listen((v) {
      widget.element.style.height = '${v}%';
    });
  }

  set duration(double duration) {
    _animWidth.duration = duration;
    _animHeight.duration = duration;
    _animWidthPercentage.duration = duration;
    _animHeightPercentage.duration = duration;
  }

  // set curve(Curves curve) {
  //   _animWidth.curve = curve;
  //   _animHeight.curve = curve;
  //   _animWidthPercentage.curve = curve;
  //   _animHeightPercentage.curve = curve;
  // }

  get width => _animWidth.value;
  set width(double width) {
    _animWidth.resetValue = widget.element.offsetWidth.toDouble();
    _animWidth.value = width;
  }

  get height => _animHeight.value;
  set height(double height) {
    _animHeight.resetValue = widget.element.offsetHeight.toDouble();
    _animHeight.value = height;
  }

  get widthPercentage => _animWidthPercentage;
  set widthPercentage(double width) {
    _animWidthPercentage.resetValue =
        widget.element.offsetWidth / widget.element.parent.offsetWidth * 100;
    _animWidthPercentage.value = width;
  }

  get heightPercentage => _animHeightPercentage;
  set heightPercentage(double height) {
    _animHeightPercentage.resetValue =
        widget.element.offsetHeight / widget.element.parent.offsetHeight * 100;
    _animHeightPercentage.value = height;
  }
}
