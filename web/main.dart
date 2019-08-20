import 'dart:html';

import 'lib/angel/angel.dart';

void main() {
  MyBox()..attach(querySelector('#output'));
}

class MyBox extends Widget {
  ListView listRef;

  @override
  Widget build() {
    return Column(
      children: [
        Container(
          color: Colors.black,
          size: Size(height: 50, width: 100),
          gestureDetector: GestureDetector(onTap: (e, w) {
            listRef.add();
          }),
        ),
        listRef = ListView(
          itemCount: 5,
          itemBuilder: () {
            return Container(
              gestureDetector: GestureDetector(
                onTap: (e, widget) {
                  listRef.removeListItem(widget);
                },
              ),
              color: Colors.green,
              size: Size(width: '100%', height: 0),
              border: Border(),
              startAnimation: Anim({
                'duration': 300,
                'height': 50,
                'easing': 'easeOutBounce',
              }),
              endAnimation: Anim({
                'duration': 300,
                'height': 0,
                'easing': 'easeOutBounce',
              }),
            );
          },
        ),
      ],
    );
  }
}
