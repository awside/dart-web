import 'dart:async';
import 'dart:html';

import 'lib/angel_framework/angel.dart';
import 'lib/anim/anime_test.dart';

void main() {
  // var myBox = MyBox();
  // myBox.setAttachmentPoint(querySelector('#output'));
  // Anim(element: querySelector('#output'));
  Anim({
    'targets': querySelector('#output'),
    'duration': 300,
    'width': 50,
  });
}

class MyBox extends Component {
  var ref = WidgetRef<Icon>();

  handleClick() {
    ref.widget.icon = Typicons.book;
  }

  @override
  Widget build() {
    return Container(
      size: Size(height: 200),
      color: Colors.green,
    );
  }
}
