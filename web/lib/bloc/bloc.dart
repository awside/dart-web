import 'dart:async';

class Bloc<T> {
  final _streamController = StreamController<T>();
  StreamSink<T> get sink => _streamController.sink;
  Stream<T> get stream => _streamController.stream;

  close() => _streamController.close();
}