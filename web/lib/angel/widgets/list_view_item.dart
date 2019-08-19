import 'package:meta/meta.dart';

import '../angel.dart';

class ListViewItem extends Widget {
  Widget item;
  Widget spacer;

  ListViewItem({
    @required this.item,
    @required this.spacer,
  });

  @override
  Widget build() {
    return Column(children: [
      item,
      spacer,
    ]);
  }
}
