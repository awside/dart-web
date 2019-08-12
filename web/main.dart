import 'dart:async';
import 'dart:html';

import 'lib/angel_framework/angel.dart';

void main() {
  querySelector('#output').children.add(MyBox().element);
}

class MyBox extends Component {
  MyBox() {
    Timer(Duration(milliseconds: 300), () {});
  }

  @override
  Widget build() {
    return Container(
      padding: Padding.all(20),
      flex: Flex(horizontal: FlexPosition.center),
      child: Container(
        color: Colors.red,
        border: Border(
          width: 0,
          radius: 8,
        ),
        shadow: Shadow(
          blur: 12,
          spread: 2,
          color: Colors.red..alpha(0.5),
        ),
        padding: Padding.only(left: 25),
        flex: Flex(vertical: FlexPosition.center),
        child: MyText(),
      ),
    );
  }
}

class MyText extends Component {
  @override
  Widget build() {
    return Label(
      text: 'Hello World!',
      fontSize: 50,
      color: Colors.white,
    );
  }
}
