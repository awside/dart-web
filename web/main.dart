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
      child: FoxRow(),
    );
  }
}

class FoxRow extends Component {
  @override
  Widget build() {
    return Row(
      children: [
        FoxColumn(),
        FoxColumn(),
        FoxColumn(),
      ],
    );
  }
}

class FoxColumn extends Component {
  @override
  Widget build() {
    return Column(
      children: [
        Fox(),
        Fox(),
        Fox(),
      ],
    );
  }
}

class Fox extends Component {
  Icon iconRef;

  handleClick(Event e) {
    if (iconRef.color.color == Colors.black.color) {
      iconRef.color = Colors.red;
    } else {
      iconRef.color = Colors.black;
    }
  }

  @override
  Widget build() {
    return Container(
      size: Size.square(50),
      child: iconRef = Icon(),
    )..gestureDetector.onTap(handleClick);
  }
}
