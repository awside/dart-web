import 'dart:html';

import '../helper/widget.dart';

class Container extends Widget {
  WidgetRef ref;
  GestureDetector gestureDetector;
  Widget child;
  String color;
  Flex flex;
  Size size;
  Margin margin;
  Padding padding;
  Border border;
  Shadow shadow;

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
  }) : super(element: DivElement(), child: child) {
    element.style
      ..display = 'flex'
      ..flex = '1'
      ..boxSizing = 'border-box'
      ..backgroundColor = color;
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
