import 'dart:js';

class Anim {
  Map<String, dynamic> animationData;

  Anim(this.animationData);

  Anim.start(this.animationData) {
    start();
  }

  start() {
    context.callMethod('anime', [JsObject.jsify(animationData)]);
  }

  addAnimationData(Map<String, dynamic> animationData) {
    animationData.addAll(animationData);
  }
}

// Anim({
//   'targets': querySelector('#output'),
//   'duration': 300,
//   'width': 50,
//   'complete': () {},
// });
