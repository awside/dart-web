import 'animation_controller.dart';
import 'bloc.dart';

class AnimatedDouble {
  double _value;
  double duration = 0;
  Curves curve;
  var _animationController = AnimationController();
  var _bloc = Bloc<double>();

  AnimatedDouble(double value) {
    this._value = value ?? 0;
  }

  Stream<double> get stream => _bloc.stream;

  get value => _value;

  set value(double newValue) {
    _animationController.stop();
    if (duration == 0) {
      _value = newValue;
      _bloc.sink.add(newValue);
      return;
    }
    _animationController.animate(
        duration: duration,
        startValue: _value,
        endValue: newValue,
        curve: curve,
        animation: (double value) {
          _value = value;
          _bloc.sink.add(value);
        });
  }
}
