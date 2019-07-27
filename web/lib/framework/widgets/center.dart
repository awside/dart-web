import 'dart:html';

import '../helper/widget.dart';

class Center extends Widget {
  WidgetRef ref;
  Widget child;
  bool horizontal;
  bool vertical;

  Center({
    this.ref,
    this.child,
    this.horizontal = true,
    this.vertical = true,
  }) : super(
          element: DivElement(),
          child: child,
        ) {
    element.style
      ..display = 'flex'
      ..flex = '1'
      ..justifyContent = horizontal ? 'center' : ''
      ..alignItems = vertical ? 'center' : '';
  }

  @override
  render() {
    ref?.applyTo(this);
  }
}
