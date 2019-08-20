import 'package:meta/meta.dart';

import '../angel.dart';

class ListView extends Widget {
  int itemCount;
  Widget Function(int index) itemBuilder;
  Widget spacer;
  List<ListViewItem> listViewItems = [];

  ListView({
    @required this.itemCount,
    @required this.itemBuilder,
    this.spacer,
  });

  @override
  Widget build() {
    for (int i = 0; i < itemCount; i++) {
      listViewItems.add(ListViewItem(
        item: itemBuilder(i),
        spacer: spacer ?? Container(size: Size(height: 8)),
      ));
    }
    return Column(children: listViewItems);
  }

  removeListItem(int index) {
    var listItem = listViewItems[index];
    listItem.remove();
    // listViewItems.remove(listItem);
  }
}
