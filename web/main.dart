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
      color: Colors.blue..alpha(0.3),
      size: Size(height: 300),
      child: Stack(
        children: [
          TopFox(),
        ],
      ),
    );
  }
}

class TopFox extends Component {
  Icon iconRef;

  @override
  Widget build() {
    return Container(
      size: Size(height: 44),
      flex: Flex(horizontal: FlexPosition.center),
      child: Container(
        size: Size.square(44),
        child: iconRef = Icon(color: Colors.grey),
      )..gestureDetector.onTap(handleClick),
    );
  }

  handleClick(Event e) {
    iconRef.color = Colors.red;
  }
}
