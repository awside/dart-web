import 'dart:html';

import 'lib/angel_framework/angel.dart';

void main() {
  var myBox = MyBox();
  myBox.setAttachmentPoint(querySelector('#output'));
}

class MyBox extends Component {
  @override
  Widget build() {
    return Container(
      size: Size(width: '100%', height: 200),
      color: Colors.blue,
      padding: Padding.all(30),
      child: Container(
        flex: Flex(flex: 1),
        color: Colors.green,
        shadow: Shadow(blur: 20, spread: -3),
        border: Border(
          color: Colors.white,
          width: 3,
          radius: 30,
        ),
      ),
    );
  }
}
