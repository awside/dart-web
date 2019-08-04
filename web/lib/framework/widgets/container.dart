import 'dart:html';

import '../helper/widget.dart';
import 'attributes/margin.dart';
import 'attributes/size.dart';

class Container extends Widget {
  WidgetRef ref;
  GestureDetector gestureDetector;
  Widget child;
  Colors color;
  SizeA size;
  MarginA margin;
  double duration;

  Container({
    this.ref,
    this.gestureDetector,
    this.child,
    this.color,
    this.size,
    this.margin,
    this.duration,
  }) : super(
          element: DivElement(),
          child: child,
        ) {
    element.style
      ..boxSizing = 'border-box'
      ..backgroundColor = color?.color;
  }

  @override
  render() {
    ref?.applyTo(this);
    gestureDetector?.applyTo(this);
    size?.applyTo(this);
    margin?.applyTo(this);
  }
}
