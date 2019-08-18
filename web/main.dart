import 'dart:html';

import 'lib2/angel/angel.dart';

void main() {
  MyBox()..attach(querySelector('#output'));
}

class MyBox extends Component {
  Container cRef;

  handleClick(e) {
    cRef.remove();
  }

  @override
  Widget build() {
    return Container(
      gestureDetector: GestureDetector(onTap: handleClick),
      size: Size(width: '100%', height: 100),
      color: Colors.green,
      startAnimation: Anim({
        'delay': 500,
        'duration': 300,
        'height': 500,
      }),
      endAnimation: Anim({
        'duration': 300,
        'height': 100,
      }),
      child: cRef = Container(
        size: Size(width: '80%', height: 50),
        color: Colors.blue,
        startAnimation: Anim({
          'duration': 300,
          'height': 300,
        }),
        endAnimation: Anim({
          'duration': 300,
          'height': 50,
        }),
        child: Container(
          size: Size(width: '40%', height: 20),
          color: Colors.red,
          startAnimation: Anim({
            'duration': 300,
            'height': 100,
          }),
          endAnimation: Anim({
            'duration': 300,
            'height': 20,
          }),
        ),
      ),
    );
  }
}
