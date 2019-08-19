import 'dart:html';

import 'package:nanoid/nanoid.dart';

class Ticker {
  static final Ticker instance = Ticker._privateConstructor();
  Ticker._privateConstructor();

  final List<String> _callbackIDs = [];
  final List<Function> _callbacks = [];

  String add(Function(int) callback) {
    _callbacks.add(callback);
    var callBackID = nanoid();
    _callbackIDs.add(callBackID);
    if (_callbacks.length == 1) window.animationFrame.then(_loop);
    return callBackID;
  }

  remove(String callBackID) {
    var index = _callbackIDs.indexOf(callBackID);
    if (index < 0) return;
    _callbackIDs.removeAt(index);
    _callbacks.removeAt(index);
  }

  _loop(num n) {
    if (_callbacks.isEmpty) return;
    for (var callback in _callbacks) {
      callback(n);
    }
    window.animationFrame.then(_loop);
  }
}
