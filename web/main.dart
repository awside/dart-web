import 'dart:html';

import 'lib/framework/component.dart';
import 'lib/framework/widget.dart';
import 'lib/framework/widgets/Icon.dart';
import 'lib/framework/widgets/attributes/color.dart';
import 'lib/framework/widgets/attributes/size.dart';
import 'lib/framework/widgets/container.dart';

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
      size: Size(height: 200),
      color: Colors.green,
    );
  }
}
