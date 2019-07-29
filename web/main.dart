import 'dart:html';

import 'package:english_words/english_words.dart';

import 'lib/framework/helper/component.dart';
import 'lib/framework/helper/widget.dart';
import 'lib/framework/widgets/column.dart';
import 'lib/framework/widgets/container.dart';
import 'lib/framework/widgets/image.dart';
import 'lib/framework/widgets/label.dart';
import 'lib/framework/widgets/row.dart';
import 'lib/framework/widgets/stack.dart';

void main() {
  MyBox(querySelector('#output'));
}

class MyBox extends Component {
  MyBox(Element attachmentPoint) : super(attachmentPoint);

  @override
  Widget build() {
    return Container(
      flex: Flex(horizontalAlign: 'center'),
      size: Size.minMax(width: [0, 1600]),
      child: Column(children: [
        Container(
          size: Size.ratio(ratio: 0.7, maxHeight: 600),
          child: Stack(
            children: [
              Container(
                color: Colors.red,
                child: Image(
                  border: Border(
                    color: Colors.white,
                    width: 20,
                  ),
                  src: 'images/house2.jpg',
                ),
              ),
              Container(
              size: Size.strict(height: 200),
              color: Colors.transparent,
              flex: Flex(
                horizontalAlign: 'center',
                verticalAlign: 'center',
              ),
              child: Label(
                nouns.take(5).map((f) => f.toUpperCase()).join(' '),
                color: Colors.red,
              ),
              )
            ],
          ),
        ),
        Container(
          size: Size.strict(height: 200),
          color: Colors('#ffeecc'),
          flex: Flex(
            horizontalAlign: 'center',
            verticalAlign: 'center',
          ),
          child: Label(
            nouns.take(5).map((f) => f.toUpperCase()).join(' '),
            color: Colors.red,
          ),
        ),
      ]),
    );
  }
}
