import 'dart:async';

import 'dart:html';

enum ScreenType { phone, tablet, desktop }

class ScreenWidthController {
  final _streamController = StreamController<ScreenType>.broadcast();
  StreamSink<ScreenType> get _sink => _streamController.sink;
  Stream<ScreenType> get stream => _streamController.stream;

  static final ScreenWidthController instance =
      ScreenWidthController._privateConstructor();
  ScreenWidthController._privateConstructor() {
    window.addEventListener('resize', (f) {
      _sink.add(getScreenType());
    });
  }

  static int getScreenWidth() {
    return window.innerWidth;
  }

  static ScreenType getScreenType() {
    var currentScreenWidth = getScreenWidth();
    if (currentScreenWidth > 0 && currentScreenWidth <= 800) {
      return ScreenType.phone;
    }
    if (currentScreenWidth > 800 && currentScreenWidth <= 1200) {
      return ScreenType.tablet;
    }
    return ScreenType.desktop;
  }
}
