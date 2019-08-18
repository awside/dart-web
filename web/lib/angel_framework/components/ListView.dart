import 'dart:html';

import 'package:meta/meta.dart';

import '../angel.dart';

class ListViewItem {
  int index;
  Element divWrapper;
  Element parentElement;
  Widget item;
  Widget spacer;

  ListViewItem(this.index, this.parentElement, this.item, this.spacer) {
    divWrapper = DivElement();
    divWrapper.children.addAll([item.element, spacer.element]);
  }

  add() {
    parentElement.children.insert(index, divWrapper);
    // Anim({
    //   'targets': item.element,
    //   'duration': 300,
    //   'height': [0, item.element.offsetHeight],
    //   'opacity': [0, 1],
    //   'easing': 'easeInQuad',
    // });
    // Anim({
    //   'targets': spacer.element,
    //   'duration': 300,
    //   'height': [0, spacer.element.offsetHeight],
    //   'opacity': [0, 1],
    //   'easing': 'easeInQuad',
    // });
  }

  remove() {
    // Anim({
    //   'targets': item.element,
    //   'duration': 300,
    //   'height': 0,
    //   'opacity': 0,
    //   'easing': 'easeOutQuad',
    // });
    // Anim({
    //   'targets': spacer.element,
    //   'duration': 300,
    //   'height': 0,
    //   'opacity': 0,
    //   'easing': 'easeOutQuad',
    //   'complete': () {
    //     parentElement.children.remove(divWrapper);
    //   }
    // });
  }
}

class ListView extends Component {
  int itemCount;
  Widget Function(int index) itemBuilder;
  Widget spacer;
  List<ListViewItem> listViewItems = [];

  ListView({
    @required this.itemCount,
    @required this.itemBuilder,
    this.spacer,
  }) {
    spacer ??= Container(size: Size(height: 8));
  }

  @override
  Widget build() {
    for (var i = 0; i < itemCount; i++) {
    }
    return Column();
  }

  add() {

  }

  insertAt(int index) {
  }
}
