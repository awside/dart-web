import 'dart:html';

import 'lib/framework/helper/component.dart';
import 'lib/framework/helper/widget.dart';
import 'lib/framework/widgets/attributes/margin.dart';
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
      size: SizeA(),
      color: Colors.blue,
      // margin: MarginA.LTRB(50, 50, 50, 50),
      duration: 300,
    );
  }
}
