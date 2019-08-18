import 'dart:html';

import 'package:meta/meta.dart';

import '../angel.dart';

// class ListViewItem {
//   Element divWrapper;
//   Element parentElement;
//   Widget item;
//   Widget spacer;

//   ListViewItem(this.parentElement, this.item, this.spacer) {
//     divWrapper = DivElement();
//   }

//   add({int at}) {
//     at != null
//         ? parentElement.children.insert(at, divWrapper)
//         : parentElement.children.add(divWrapper);
//     item.activate(divWrapper);
//     spacer.activate(divWrapper);
//   }

//   remove() {}
// }

class ListView extends Component {
  int itemCount;
  Widget Function(int index) itemBuilder;
  Widget spacer;
  List<WidgetBase> listViewItems = [];

  ListView({
    @required this.itemCount,
    @required this.itemBuilder,
    this.spacer,
  }) {
    spacer ??= Container(size: Size(height: 8));
  }

  @override
  Widget build() {
    for (int i = 0; i < itemCount; i++) {
      listViewItems.add(ListViewItem(
        item: null,
        spacer: null,
      ));
    }
    return Column(children: listViewItems);
  }

  add() {}

  insertAt(int index) {}
}
