import 'dart:html';

import '../helper/widget.dart';
import 'attributes/border.dart';
import 'attributes/color.dart';
import 'attributes/padding.dart';
import 'attributes/position.dart';
import 'attributes/shadow.dart';
import 'attributes/size.dart';

class Container extends Widget {
  WidgetRef ref;
  GestureDetector gestureDetector;
  Widget child;
  Colors color;
  Size size;
  Padding padding;
  Position position;
  Border border;
  Shadow shadow;
  double duration;

  Container({
    this.ref,
    this.gestureDetector,
    this.child,
    this.duration,
    this.color,
    this.size,
    this.padding,
    this.position,
    this.border,
    this.shadow,
  }) : super(
          element: DivElement(),
          child: child,
        );

  @override
  render() {
    element.style
      ..overflow = 'hidden'
      ..boxSizing = 'border-box';
    ref?.applyTo(this);
    (gestureDetector ??= GestureDetector()).applyTo(this);
    color ??= Colors.white;
    color.stream.listen((v) => element.style.background = v);
    (size ??= Size()).applyTo(this);
    (padding ??= Padding()).applyTo(this);
    (position ??= Position()).applyTo(this);
    (border ??= Border()).applyTo(this);
    (shadow ??= Shadow()).applyTo(this);
  }
}
