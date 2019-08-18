import 'dart:async';
import 'dart:html';

import 'lib/angel_framework/angel.dart';

void main() {
  MyBox()..activate(querySelector('#output'));
}

class MyBox extends Component {
  Container cRef;

  @override
  Widget build() {
    return Container(
      color: Colors.black,
      size: Size(width: 100, height: 100),
      child: cRef = Container(
        color: Colors.red,
        size: Size(width: 50, height: 50),
        endAnimation: Anim({
          'duration': 600,
          'width': 80,
        }),
      ),
    );
  }
}
