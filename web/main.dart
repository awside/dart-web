import 'dart:html';

import 'lib/angel/angel.dart';

void main() {
  MyBox()..attach(querySelector('#output'));
}

class MyBox extends Widget {
  Container cRef;

  handleClick(e) {
    cRef.remove();
  }

  @override
  Widget build() {
    return cRef = Container(
      color: Colors.blue,
      size: Size(width: 200, height: 200),
    );
  }
}
