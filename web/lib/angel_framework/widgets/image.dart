import 'dart:html';

import 'package:meta/meta.dart';

import '../widget.dart';

enum ImageSize { cover, contain }

class Image extends Widget {
  Image({
    @required String src,
    ImageSize imageSize = ImageSize.contain,
    Colors color,
  }) : super(
          element: DivElement(),
        ) {
    element.style
      ..width = '100%'
      ..height = '100%'
      ..backgroundImage = 'url("${src}")'
      ..backgroundPosition = 'center'
      ..backgroundSize = imageSize.toString().split('.')[1]
      ..backgroundRepeat = 'no-repeat';
    var overlay = DivElement();
    overlay.style
      ..width = '100%'
      ..height = '100%'
      ..backgroundColor = color?.color ?? Colors.transparent.color;
    element.children.add(overlay);
  }
}
