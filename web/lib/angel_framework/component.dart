import 'dart:html';

import 'widget.dart';

abstract class Component {
  Widget widget;
  Element _attachmentPoint;

  setAttachmentPoint(Element attachmentPoint) {
    _attachmentPoint = attachmentPoint;
    widget = build();
    _attachmentPoint.children.add(widget.element);
  }

  Widget build();
}