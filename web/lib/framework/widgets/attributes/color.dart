import 'package:hex/hex.dart';

import '../../../anim/animated_double.dart';
import '../../../anim/animation_controller.dart';
import '../../../bloc/bloc.dart';

class Colors {
  AnimatedDouble _animRed;
  AnimatedDouble _animGreen;
  AnimatedDouble _animBlue;
  AnimatedDouble _animAlpha;
  var _bloc = Bloc<String>();

  Colors._(String hexColor, {double alpha}) {
    var decodedColor = HEX.decode(hexColor.replaceAll('#', ''));
    _animRed = AnimatedDouble(decodedColor[0] as double);
    _animGreen = AnimatedDouble(decodedColor[1] as double);
    _animBlue = AnimatedDouble(decodedColor[2] as double);
    _animAlpha = AnimatedDouble(alpha ?? 1);
    _sinkRGB();
    _animRed.stream.listen((v) => _sinkRGB());
    _animGreen.stream.listen((v) => _sinkRGB());
    _animBlue.stream.listen((v) => _sinkRGB());
    _animAlpha.stream.listen((v) => _sinkRGB());
  }

  _sinkRGB() {
    _bloc.sink.add(
        'rgba(${_animRed.value}, ${_animGreen.value}, ${_animBlue.value}, ${_animAlpha.value})');
  }

  Stream<String> get stream => _bloc.stream;

  set duration(double duration) {
    _animRed.duration = duration;
    _animGreen.duration = duration;
    _animBlue.duration = duration;
    _animAlpha.duration = duration;
  }

  set curve(Curves curve) {
    _animRed.curve = curve;
    _animGreen.curve = curve;
    _animBlue.curve = curve;
    _animAlpha.curve = curve;
  }

  get alpha => _animAlpha.value;
  set alpha(double alpha) => _animAlpha.value = alpha;

  set color(String hexColor) {
    var decodedColor = HEX.decode(hexColor.replaceAll('#', ''));
    _animRed.value = decodedColor[0] as double;
    _animGreen.value = decodedColor[1] as double;
    _animBlue.value = decodedColor[2] as double;
  }

  static Colors get transparent => Colors._('#ffffff', alpha: 0);
  static Colors get white => Colors._('#ffffff');
  static Colors get black => Colors._('#000000');
  static Colors get grey => Colors._('#808080');
  static Colors get red => Colors._('#ab5454');
  static Colors get blue => Colors._('#5488ab');
  static Colors get green => Colors._('#54ab60');
}
