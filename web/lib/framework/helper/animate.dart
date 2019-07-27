import 'package:meta/meta.dart';

import 'ticker.dart';

class AnimationController {
  double duration;
  double _startTime;
  double startValue;
  double endValue;
  Function(double) callback;
  Function() complete;
  Curves curve;
  String tickerID;

  AnimationController(
      {@required this.startValue,
      @required this.endValue,
      @required this.duration,
      this.curve = Curves.linear});

  animate(
      {@required Function(double) callback, @required Function() complete}) {
    this.callback = callback;
    this.complete = complete;
    _startTime = null;
    Ticker.instance.remove(tickerID);
    tickerID = Ticker.instance.add(_loop);
  }

  _loop(num n) {
    if (_startTime == null) _startTime = n;
    var elapsedTime = n - _startTime;
    if (elapsedTime >= duration) {
      callback(endValue);
      complete();
      Ticker.instance.remove(tickerID);
      return;
    }
    callback(
        (endValue - startValue) * calcCurve(curve, elapsedTime / duration) +
            startValue);
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
