import 'package:meta/meta.dart';

import '../bloc/bloc.dart';
import 'curves.dart';
import 'ticker.dart';

class AnimValue {
  final double startValue;
  final double endValue;
  final double duration;
  // final Curves curve;
  double _startTime;
  String _tickerID;
  var _blocFrame = Bloc<double>();
  var _blocComplete = Bloc<bool>();

  AnimValue({
    @required this.startValue,
    @required this.endValue,
    this.duration = 0,
    // this.curve = Curves.linear,
  }) {
    _start();
  }

  Stream<double> get streamFrame => _blocFrame.stream;
  Stream<bool> get streamComplete => _blocComplete.stream;

  stop() => Ticker.instance.remove(_tickerID);

  _start() {
    _tickerID = Ticker.instance.add(_loop);
  }

  _loop(num n) {
    _startTime = n;
    var elapsedTime = n - _startTime;
    if (elapsedTime >= duration) {
      stop();
      _blocFrame.sink.add(endValue);
      _blocComplete.sink.add(true);
      return;
    }
    // _blocFrame.sink.add(
    //     (endValue - startValue) * calcCurve(curve, elapsedTime / duration) +
    //         startValue);
  }
}