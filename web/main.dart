import 'dart:html';

import 'lib/framework/helper/component.dart';
import 'lib/framework/helper/widget.dart';
import 'lib/framework/widgets/container.dart';
import 'lib/framework/widgets/image.dart';
import 'lib/framework/widgets/label.dart';
import 'lib/framework/widgets/stack.dart';

void main() {
  var myBox = MyBox();
  myBox.setAttachmentPoint(querySelector('#output'));
}

class MyBox extends Component {
  @override
  Widget build() {
    return Container(
      flex: Flex(horizontalAlign: 'center'),
      size: Size.minMax(width: [0, 1600]),
      child: Container(
        color: Colors.blue,
        size: Size.ratio(ratio: 0.7, maxHeight: 500),
        child: Stack(children: [
          Container(
            child: Image(src: 'images/house1.jpg'),
          ),
          Container(
            flex: Flex(horizontalAlign: 'center', verticalAlign: 'center'),
            child: Label(
              'Hello World',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }
}
