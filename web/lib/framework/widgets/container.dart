import 'dart:html';

import '../helper/widget.dart';
import 'attributes/padding.dart';
import 'attributes/size.dart';

class Container extends Widget {
  WidgetRef ref;
  GestureDetector gestureDetector;
  Widget child;
  Colors color;
  Size size;
  Padding padding;
  double duration;

  Container({
    this.ref,
    this.gestureDetector,
    this.child,
    this.color,
    this.size,
    this.padding,
    this.duration,
  }) : super(
          element: DivElement(),
          child: child,
        );

  @override
  render() {
    element.style
      ..boxSizing = 'border-box'
      ..backgroundColor = color?.color;
    ref?.applyTo(this);
    gestureDetector?.applyTo(this);
    size ??= Size();
    size.applyTo(this);
    padding?.applyTo(this);
  }
}
