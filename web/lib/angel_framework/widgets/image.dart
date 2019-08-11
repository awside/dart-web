import 'dart:html';

import 'package:meta/meta.dart';

import '../widget.dart';
import 'attributes/border.dart';
import 'attributes/shadow.dart';

class Image extends Widget {
  String src;
  // Colors color;
  Border border;
  Shadow shadow;

  Image({
    @required String src,
    // this.color,
    this.border,
    this.shadow,
  }) : super(
          element: DivElement(),
        ) {
    element.style
      ..flex = '1'
      ..backgroundImage = 'url("${src}")'
      // ..backgroundColor = color?.color ?? Colors.white.color
      ..backgroundPosition = 'center'
      ..backgroundSize = 'cover' // cover or contain
      ..backgroundRepeat = 'no-repeat';
  }

  @override
  initialStyle() {
    // TODO: implement initialStyle
    return null;
  }

  // @override
  // render() {
  //   // ref?.applyTo(this);
  //   border?.applyTo(this);
  //   shadow?.applyTo(this);
  // }
}
