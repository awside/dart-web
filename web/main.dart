import 'dart:async';
import 'dart:html';

import 'lib/angel_framework/angel.dart';

void main() {
  var myBox = MyBox();
  myBox.setAttachmentPoint(querySelector('#output'));
}

class MyBox extends Component {
  Container cRef;

  MyBox() {
    Timer(Duration(milliseconds: 300), () {});
  }

  @override
  Widget build() {
    return Container(
      padding: Padding.all(20),
      flex: Flex(horizontal: FlexPosition.center),
      child: cRef = Container(
        color: Colors.red,
        border: Border(
          color: Colors.black,
          width: 5,
          radius: 8,
        ),
        shadow: Shadow(
          blur: 25,
          spread: -3,
          color: Colors.red,
        ),
        padding: Padding.only(left: 25),
        flex: Flex(vertical: FlexPosition.center),
        child: Label(
          text: 'Hello World!',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
