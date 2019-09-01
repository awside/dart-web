// import 'package:meta/meta.dart';

// import '../angel.dart';

// class ListView extends Widget {
//   int itemCount;
//   Widget Function() itemBuilder;
//   List<Widget> listViewItems = [];

//   ListView({
//     @required this.itemCount,
//     @required this.itemBuilder,
//   });

//   @override
//   Widget build() {
//     for (int i = 0; i < itemCount; i++) {
//       listViewItems.add(
//         itemBuilder(),
//       );
//     }
//     return VStack(children: listViewItems);
//   }

//   add({int at}) {
//     var item = itemBuilder();
//     if (at != null) {
//       at = at > itemCount ? itemCount : at;
//       item.attach(element, at: at);
//     } else {
//       item.attach(element, at: 0);
//     }
//     listViewItems.add(item);
//     itemCount = listViewItems.length;
//   }

//   removeListItem(Widget widget) {
//     var listItem = listViewItems.firstWhere(
//       (item) => item == widget,
//       orElse: () => null,
//     );
//     if (listItem == null) return;
//     listItem.remove();
//     listViewItems.remove(listItem);
//     itemCount = listViewItems.length;
//   }
// }
