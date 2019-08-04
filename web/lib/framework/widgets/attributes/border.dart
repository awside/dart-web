import '../../helper/animation_controller.dart';
import '../../helper/widget.dart';

class Border {
  Widget widget;
  double duration = 0;
  Colors color;
  double _width;
  String style;
  double _radius;
  var _widthAnimationController = AnimationController();
  var _radiusAnimationController = AnimationController();

  Border({
    double width,
    double radius,
    Colors color,
    String style,
  }) {
    this._width = width ?? 1;
    this._radius = radius ?? 0;
    this.color = color ?? Colors.black;
    this.style = style ?? 'solid';
  }

  applyTo(Widget widget) {
    this.widget = widget;
    widget.element.style
      ..borderColor = color.color
      ..borderWidth = '${_width}px'
      ..borderStyle = style
      ..borderRadius = '${_radius}px';
  }

  set width(double width) {
    _widthAnimationController.animate(
      duration: duration,
      startValue: this._width,
      endValue: width,
      animation: (double value) {
        _width = value;
        widget.element.style.borderWidth = '${_width}px';
      },
    );
  }

  set radius(double radius) {
    _radiusAnimationController.animate(
      duration: duration,
      startValue: this._radius,
      endValue: radius,
      animation: (double value) {
        _radius = value;
        widget.element.style.borderRadius = '${_radius}px';
      },
    );
  }
}
