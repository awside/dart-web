import 'dart:html';

import 'package:meta/meta.dart';

import '../helper/widget.dart';

class Image extends Widget {
  WidgetRef ref;
  String src;
  Colors color;
  Border border;
  Shadow shadow;

  Image({
    this.ref,
    @required String src,
    this.color,
    this.border,
    this.shadow,
  }) : super(
          element: DivElement(),
        ) {
    element.style
      ..flex = '1'
      ..backgroundImage = 'url("${src}")'
      ..backgroundColor = color?.color ?? Colors.white
      ..backgroundPosition = 'center'
      ..backgroundSize = 'cover' // cover or contain
      ..backgroundRepeat = 'no-repeat';
  }

  @override
  render() {
    ref?.applyTo(this);
    border?.applyTo(this);
    shadow?.applyTo(this);
  }
}
