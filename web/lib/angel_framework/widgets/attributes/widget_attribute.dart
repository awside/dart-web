import 'package:meta/meta.dart';

import '../../widget.dart';

abstract class WidgetAttribute {
  Widget widget;

  applyTo(Widget widget) {
    this.widget = widget;
    applyToElement();
  }

  @protected
  applyToElement();
}
