import 'dart:html';

import 'lib/angel/angel.dart';

void main() {
  MyBox()..attach(querySelector('#output'));
}

class MyBox extends Widget {
  ListView listRef;

  @override
  Widget build() {
    return listRef = ListView(
      itemCount: 5,
      itemBuilder: (index) {
        return Container(
          gestureDetector: GestureDetector(
            onTap: (f) {
              listRef.removeListItem(index);
            },
          ),
          color: Colors.green,
          size: Size(width: '100%', height: 0),
          startAnimation: Anim({
            'duration': 300,
            'height': 50,
            'easing': 'easeInQuad',
          }),
          endAnimation: Anim({
            'duration': 300,
            'height': 0,
            'easing': 'easeOutQuad',
          }),
        );
      },
    );
  }
}
