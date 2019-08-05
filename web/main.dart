import 'dart:html';

import 'lib/framework/helper/animation_controller.dart';
import 'lib/framework/helper/component.dart';
import 'lib/framework/helper/widget.dart';
import 'lib/framework/widgets/attributes/border.dart';
import 'lib/framework/widgets/attributes/padding.dart';
import 'lib/framework/widgets/attributes/position.dart';
import 'lib/framework/widgets/attributes/shadow.dart';
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
    ..curve = Curves.easeInOutQuad
    ..duration = 300
    ..heightPercentage = 50
    ..width = 100;
  }

  @override
  Widget build() {
    return Container(
      size: Size(height: 200),
      color: Colors.white,
      child: Container(
        ref: ref,
        gestureDetector: GestureDetector(
          onTap: (e) => handleClick(),
        ),
        color: Colors.blue,
        size: Size(),
        position: Position(),
      ),
    );
  }
}
