import 'dart:js';

class Anim {
  Map<String, dynamic> _animationData;

  Anim(this._animationData);

  Anim.start(this._animationData) {
    start();
  }

  start() {
    context.callMethod('anime', [JsObject.jsify(_animationData)]);
  }

  addAnimationData(Map<String, dynamic> animationData) {
    _animationData.addAll(animationData);
  }
}

// Anim({
//   'targets': querySelector('#output'),
//   'duration': 300,
//   'width': 50,
//   'complete': () {},
// });
