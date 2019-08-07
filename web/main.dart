import 'dart:html';

import 'lib/framework/helper/animation_controller.dart';
import 'lib/framework/helper/component.dart';
import 'lib/framework/helper/widget.dart';
import 'lib/framework/widgets/Icon.dart';
import 'lib/framework/widgets/attributes/border.dart';
import 'lib/framework/widgets/attributes/color.dart';
import 'lib/framework/widgets/attributes/flex.dart';
import 'lib/framework/widgets/attributes/font_weight.dart';
import 'lib/framework/widgets/attributes/padding.dart';
import 'lib/framework/widgets/attributes/position.dart';
import 'lib/framework/widgets/attributes/shadow.dart';
import 'lib/framework/widgets/attributes/size.dart';
import 'lib/framework/widgets/container.dart';
import 'lib/framework/widgets/label.dart';

void main() {
  var myBox = MyBox();
  myBox.setAttachmentPoint(querySelector('#output'));
}

class MyBox extends Component {
  var ref = WidgetRef<Icon>();

  handleClick() {
    ref.widget.icon = Typicons.book;
  }

  @override
  Widget build() {
    return Container(
      gestureDetector: GestureDetector(
        onTap: (f) => handleClick(),
      ),
      size: Size(height: 100),
      color: Colors.blue,
      flex: Flex(
        horizontal: FlexPosition.center,
        vertical: FlexPosition.center,
      ),
      child: Container(
        size: Size(height: 32),
        child: Icon(
          ref: ref,
        ),
      ),
    );
  }
}
