import 'dart:html';

import 'lib/framework/helper/component.dart';
import 'lib/framework/helper/widget.dart';
import 'lib/framework/widgets/container.dart';
import 'lib/framework/widgets/image.dart';
import 'lib/framework/widgets/row.dart';

void main() {
  MyBox(querySelector('#output'));
}

class MyBox extends Component {
  MyBox(Element attachmentPoint) : super(attachmentPoint);

  @override
  Widget build() {
    return testImage;
  }
}

var testImage = Container(
  size: Size.ratio(ratio: 0.7, maxHeight: 1000),
  child: Row(
    children: [
      Image(src: 'images/house1.jpg'),
      Image(src: 'images/house2.jpg'),
    ],
  ),
);
