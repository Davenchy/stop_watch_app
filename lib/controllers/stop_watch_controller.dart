import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../utils/memory.dart';

class StopWatchController extends ChangeNotifier {
  StopWatchController() {
    _ticker = Ticker(_onTick);
  }

  late final Ticker _ticker;
  Duration _oldElapsedTime = Duration.zero;
  Duration _elapsedTime = Duration.zero;

  bool get isActive => _ticker.isActive;
  Duration get elapsedTime => _elapsedTime + _oldElapsedTime;

  double get millisecondsHandAngle =>
      elapsedTime.inMilliseconds / 60000 * (pi * 2);

  void setElapsedTime(Duration elapsedTime) {
    _oldElapsedTime = elapsedTime;
    _elapsedTime = Duration.zero;
    notifyListeners();
  }

  void start() => _ticker.start();

  void reset() {
    _ticker.stop();
    _oldElapsedTime = Duration.zero;
    _elapsedTime = Duration.zero;
    notifyListeners();
  }

  void stop() {
    _oldElapsedTime += _elapsedTime;
    _ticker.stop();
  }

  void toggle() {
    if (isActive) {
      stop();
    } else {
      start();
    }
  }

  void save() => Memory.saveElapsedTime(elapsedTime);

  void restore() => setElapsedTime(Memory.restoreElapsedTime());

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    _elapsedTime = elapsed;
    notifyListeners();
  }
}
