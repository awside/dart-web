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
      flex: Flex(
        horizontal: FlexPosition.center,
        vertical: FlexPosition.center,
      ),
      child: Container(
        size: Size(height: 200),
        flex: Flex(vertical: FlexPosition.center),
        child: Image(src: './images/SwampFoxIcon.png'),
      ),
    );
  }
}
