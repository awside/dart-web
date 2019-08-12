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
      flex: Flex(
        horizontal: FlexPosition.center,
        vertical: FlexPosition.center,
      ),
      child: FoxRow(),
    );
  }
}

class FoxRow extends Component {
  @override
  Widget build() {
    return Row(
      children: [
        Fox(),
        Fox(),
        Fox(),
      ],
    );
  }
}

class Fox extends Component {
  @override
  Widget build() {
    return Container(
      size: Size(height: 80, width: 80),
      padding: Padding.only(left: 20),
      child: Image(src: './images/SwampFoxIcon.png'),
    );
  }
}
