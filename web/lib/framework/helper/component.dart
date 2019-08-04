import 'dart:html';

import 'widget.dart';

abstract class Component {
  Widget widget;
  Element _attachmentPoint;

  setAttachmentPoint(Element attachmentPoint) {
    this._attachmentPoint = attachmentPoint;
    widget = build();
    widget.render();
    widget.renderChildren();
    _attachmentPoint.children.add(widget.element);
  }

  Widget build();
}
