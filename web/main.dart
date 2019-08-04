import 'dart:html';

import 'lib/framework/helper/component.dart';
import 'lib/framework/helper/widget.dart';
import 'lib/framework/widgets/attributes/padding.dart';
import 'lib/framework/widgets/attributes/size.dart';
import 'lib/framework/widgets/container.dart';

void main() {
  var myBox = MyBox();
  myBox.setAttachmentPoint(querySelector('#output'));
}

class MyBox extends Component {
  var ref = WidgetRef<Container>();

  handleClick() {
    ref.widget.size
      ..duration = 300
      ..widthPercentage = 50
      ..heightPercentage = 50
      ..widthPercentage = 90;
  }

  @override
  Widget build() {
    return Container(
      ref: ref,
      gestureDetector: GestureDetector(
        onTap: (e) => handleClick(),
      ),
      size: Size(height: 200),
      color: Colors.blue,
      padding: Padding(30),
      child: Container(
        color: Colors.green,
      ),
    );
  }
}
