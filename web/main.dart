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
      flex: Flex(horizontalAlign: 'center', verticalAlign: 'center'),
      size: Size.strict(height: 400),
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
