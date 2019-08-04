import 'dart:html';

import '../helper/widget.dart';

class Container extends Widget {
  WidgetRef ref;
  GestureDetector gestureDetector;
  Widget child;
  Colors color;
  Flex flex;
  Size size;
  Margin margin;
  Padding padding;
  Border border;
  Shadow shadow;
  double duration;

  Container({
    this.ref,
    this.gestureDetector,
    this.child,
    this.color,
    this.flex,
    this.size,
    this.margin,
    this.padding,
    this.border,
    this.shadow,
    this.duration,
  }) : super(
          element: DivElement(),
          child: child,
        ) {
    element.style
      ..flex = '1'
      ..display = 'flex'
      ..boxSizing = 'border-box'
      ..backgroundColor = color?.color;
  }

  @override
  render() {
    ref?.applyTo(this);
    gestureDetector?.applyTo(this);
    flex?.applyTo(this);
    size?.applyTo(this);
    margin?.applyTo(this);
    padding?.applyTo(this);
    border?.applyTo(this);
    shadow?.applyTo(this);
  }
}
