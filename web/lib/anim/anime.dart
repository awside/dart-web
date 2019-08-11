import 'dart:js';

class Anim {
  Anim(Map<dynamic, dynamic> map) {
    context.callMethod('anime', [JsObject.jsify(map)]);
  }
}

// Anim({
  //   'targets': querySelector('#output'),
  //   'duration': 300,
  //   'width': 50,
  // });
