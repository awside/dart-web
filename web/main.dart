import 'dart:async';
import 'dart:html';

import 'lib/angel_framework/angel.dart';

void main() {
  var myBox = MyBox();
  myBox.setAttachmentPoint(querySelector('#output'));
}

class MyBox extends Component {

  MyBox() {
    Timer(Duration(milliseconds: 300), () {
    });
  }

  @override
  Widget build() {
    return Container();
  }
}
