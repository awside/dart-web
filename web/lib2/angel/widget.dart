import 'dart:html';

import '../bloc/bloc.dart';
import 'anime.dart';
import 'attributes/widget_attributes.dart';

export 'anime.dart';
export 'attributes/widget_attributes.dart';

abstract class Widget {
  Element parent;
  Element element;
  List<Widget> children = [];
  List<WidgetAttribute> widgetAttributes = [];
  Anim startAnimation;
  Anim endAnimation;

  var bloc = Bloc<bool>();
  int removedChildrenCounter;

  Widget(this.element, this.children) {
    children.removeWhere((child) => child == null);
  }

  attach(Element parent) {
    this.parent = parent;
    parent.children.add(element);
    for (var widgetAttr in widgetAttributes) {
      if (widgetAttr != null) apply(widgetAttr);
    }
    for (var child in children) {
      child.attach(element);
    }
    removedChildrenCounter = 0;
  }

  animate() {
    if (startAnimation == null) return;
    startAnimation.addAnimationData({
      'targets': element,
      'complete': () {
        for (var child in children) {
          child.animate();
        }
      },
    });
    startAnimation.start();
  }

  remove({bool top = true}) {
    if (children.isNotEmpty) {
      for (var child in children) {
        child.bloc.stream.listen((f) {
          removedChildrenCounter += 1;
          if (removedChildrenCounter == children.length) {
            _removeAnimation(top: top);
          }
        });
        child.remove(top: false);
      }
    } else {
      _removeAnimation(top: top);
    }
  }

  _removeAnimation({bool top = true}) {
    if (endAnimation != null) {
      endAnimation.addAnimationData({
        'targets': element,
        'complete': () {
          bloc.sink.add(true);
          if (top) {
            for (var child in children) {
              child.parent.children.remove(child.element);
              child.bloc.close();
            }
            parent?.children?.remove(element);
          }
        },
      });
      endAnimation.start();
    } else {
      bloc.sink.add(true);
    }
  }

  apply(WidgetAttribute widgetAttribute) {
    widgetAttribute.applyToElement(element);
  }
}
