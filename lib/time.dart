
/// Simple utility class that helps handling time counting and implementing interval like events.
///
class Timer {
  final double _limit;
  void Function() _callback;
  bool _repeat;
  double _current = 0;
  bool _running = false;

  Timer(this._limit, { repeat = false, callback }) {
    _repeat = repeat;
    _callback = callback;
  }

  double get current {
    return _current;
  }

  void update(double dt) {
    if (_running) {
      _current += dt;

      if (isFinished()) {
        if (_repeat) {
          _current -= _limit;
        } else {
          _running = false;
        }

        if (_callback != null) {
          _callback();
        }
      }
    }
  }

  bool isFinished() {
    return _current >= _limit;
  }

  void start() {
    _current = 0;
    _running = true;
  }
  
  void stop() {
    _current = 0;
    _running = false;
  }
}
