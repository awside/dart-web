import 'package:meta/meta.dart';

import 'ticker.dart';

class AnimationController {
  double _duration;
  double _startTime;
  double _startValue;
  double _endValue;
  Function(double) _animation;
  Function() _complete;
  Curves _curve;
  String _tickerID;

  animate({
    @required double startValue,
    @required double endValue,
    @required double duration,
    @required Function(double) animation,
    Function() complete,
    Curves curve,
  }) {
    this._startValue = startValue;
    this._endValue = endValue;
    this._duration = duration;
    this._animation = animation;
    this._complete = complete ?? () {};
    this._curve = curve ?? Curves.linear;
    _startTime = null;
    Ticker.instance.remove(_tickerID);
    _tickerID = Ticker.instance.add(_loop);
  }

  _loop(num n) {
    if (_startTime == null) _startTime = n;
    var elapsedTime = n - _startTime;
    if (elapsedTime >= _duration) {
      _animation(_endValue);
      _complete?.call();
      Ticker.instance.remove(_tickerID);
      return;
    }
    _animation(
        (_endValue - _startValue) * calcCurve(_curve, elapsedTime / _duration) +
            _startValue);
  }
}

calcCurve(Curves easing, num t) {
  switch (easing) {
    case Curves.linear:
      return t;
    case Curves.easeInQuad:
      return t * t;
    case Curves.easeOutQuad:
      return t * (2 - t);
    case Curves.easeInOutQuad:
      return t < .5 ? 2 * t * t : -1 + (4 - 2 * t) * t;
    case Curves.easeInCubic:
      return t * t * t;
    case Curves.easeOutCubic:
      return (--t) * t * t + 1;
    case Curves.easeInOutCubic:
      return t < .5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1;
    case Curves.easeInQuart:
      return t * t * t * t;
    case Curves.easeOutQuart:
      return 1 - (--t) * t * t * t;
    case Curves.easeInOutQuart:
      return t < .5 ? 8 * t * t * t * t : 1 - 8 * (--t) * t * t * t;
    case Curves.easeInQuint:
      return t * t * t * t * t;
    case Curves.easeOutQuint:
      return 1 + (--t) * t * t * t * t;
    case Curves.easeInOutQuint:
      return t < .5 ? 16 * t * t * t * t * t : 1 + 16 * (--t) * t * t * t * t;
  }
}

enum Curves {
  linear,
  easeInQuad,
  easeOutQuad,
  easeInOutQuad,
  easeInCubic,
  easeOutCubic,
  easeInOutCubic,
  easeInQuart,
  easeOutQuart,
  easeInOutQuart,
  easeInQuint,
  easeOutQuint,
  easeInOutQuint
}
