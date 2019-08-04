import 'dart:html';

import '../helper/widget.dart';
import 'attributes/border.dart';
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
    this.color,
    this.size,
    this.padding,
    this.position,
    this.border,
    this.shadow,
    this.duration,
  }) : super(
          element: DivElement(),
          child: child,
        );

  @override
  render() {
    element.style
      ..overflow = 'hidden'
      ..boxSizing = 'border-box'
      ..backgroundColor = color?.color;
    ref?.applyTo(this);
    gestureDetector?.applyTo(this);
    size ??= Size();
    size.applyTo(this);
    padding?.applyTo(this);
    position?.applyTo(this);
    border?.applyTo(this);
    shadow?.applyTo(this);
  }
}
