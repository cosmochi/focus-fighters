// timer_manager.dart
import 'dart:async';

class TimerManager {
  static final TimerManager _instance = TimerManager._internal();
  Timer? _timer;
  int remainingTime = 0;
  bool isRunning = false;

  TimerManager._internal();

  static TimerManager get instance => _instance;

  void startTimer(void Function() tickCallback) {
    if (!isRunning && remainingTime > 0) {
      isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (remainingTime > 0) {
          remainingTime--;
          tickCallback();
        } else {
          stopTimer();
          tickCallback();
        }
      });
    }
  }

  void stopTimer() {
    _timer?.cancel();
    isRunning = false;
    remainingTime = 0;
    _timer = null;
  }


  void resetTimer(int time) {
    stopTimer();
    remainingTime = time;
  }
}
