// import 'dart:html';

// import '../widget.dart';

// class Stack extends Widget {
//   Stack({
//     List<Widget> children,
//   }) : super(
//           element: DivElement(),
//           children: children,
//         ) {
//     Size().applyToElement(element);
//     element.style..display = 'grid';

//     for (var child in children) {
//       var stackLayer = DivElement();
//       stackLayer.style
//         ..gridColumn = '1'
//         ..gridRow = '1';
//       element.children.add(stackLayer);
//       stackLayer.children.add(child.element);
//     }
//   }
// }
