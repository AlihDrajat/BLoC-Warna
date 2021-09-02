import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum ColorEvent { to_lightBlue, to_purple }

class ColorBloC {
  Color _color = Colors.lightBlue;

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_lightBlue)
      _color = Colors.lightBlue;
    else
      _color = Colors.purple;

    _stateSink.add(_color);
  }

  ColorBloC() {
    _eventController.stream.listen(_mapEventToState);
  }

  void disopose() {
    _eventController.close();
    _stateController.close();
  }
}
