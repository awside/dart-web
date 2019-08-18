import 'dart:html';

import 'lib/angel_framework/angel.dart';

void main() {
  MyBox()..activate(querySelector('#output'));
}

class MyBox extends Widget {
  MyBox() {
    element = Container(
      color: Colors.black,
      size: Size(width: '100%', height: 50),
    ).element;
  }
}
