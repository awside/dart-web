import 'package:meta/meta.dart';

import '../angel.dart';

class ListView extends Widget {
  int itemCount;
  Widget Function(int index) itemBuilder;
  Widget spacer;
  List<Widget> listViewItems = [];

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
      listViewItems.add(Column(children: [
        itemBuilder(i),
        spacer,
      ]));
    }
    return Column(children: listViewItems);
  }
}
