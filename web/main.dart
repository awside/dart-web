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
          Fox(300, Colors.blue),
          Fox(200, Colors.green),
          Fox(100, Colors.grey),
        ],
      ),
    );
  }
}

class Fox extends Component {
  final double size;
  final Colors color;
  Icon iconRef;

  Fox(this.size, this.color);

  @override
  Widget build() {
    return Container(
      size: Size.square(size),
      child: iconRef = Icon(color: color),
    )..gestureDetector.onTap(handleClick);
  }

  handleClick(Event e) {
    iconRef.color = Colors.red;
  }
}
