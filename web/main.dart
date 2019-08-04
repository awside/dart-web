import 'dart:html';

import 'lib/framework/helper/component.dart';
import 'lib/framework/helper/widget.dart';
import 'lib/framework/widgets/container.dart';

void main() {
  var myBox = MyBox();
  myBox.setAttachmentPoint(querySelector('#output'));
}

class MyBox extends Component {
  var ref = WidgetRef<Container>();

  handleClick() {
    print(ref.widget.margin.left);
  }

  @override
  Widget build() {
    return Container(
      ref: ref,
      gestureDetector: GestureDetector(
        onTap: (e) => handleClick(),
      ),
      size: Size.strict(height: 400),
      color: Colors.green,
      margin: Margin.all(10),
      duration: 300,
    );
  }
}
