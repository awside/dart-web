import 'dart:html';

import 'lib/angel/angel.dart';

void main() {
  Root(querySelector('#output'), MyBox());
}

class MyBox extends Widget {
  Container cRef;

  @override
  whenPhone() {
    cRef = replaceWith(
      Container(
        size: Size(height: 500),
        color: Colors.green,
        flex: Flex(vertical: FlexPosition.center),
        padding: Padding.only(left: 20, right: 20),
        child: Container(
          color: Colors.blue,
          size: Size(height: 20),
        ),
      ),
    );
  }

  @override
  Widget build() {
    return Container(
      size: Size(height: 50),
      color: Colors.green,
      flex: Flex(vertical: FlexPosition.center),
      padding: Padding.only(left: 20, right: 20),
      child: Container(
        color: Colors.blue,
        size: Size(height: 20),
      ),
    );
  }
}
