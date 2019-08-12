import 'widget.dart';

abstract class Component extends Widget {
  Component() : super.component() {
    element = build().element;
  }

  Widget build();
}
