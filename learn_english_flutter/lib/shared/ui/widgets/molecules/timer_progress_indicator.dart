import 'package:flutter/material.dart';

enum TimerState {
  running,
  paused,
  stopped,
}

class TimerProgressIndicator extends StatefulWidget {
  final int maxTimeInSecond;
  final bool? isAutoStart;
  final VoidCallback? onTimeEnd;
  final TimerProgressController? controller;

  const TimerProgressIndicator({
    super.key,
    required this.maxTimeInSecond,
    this.controller,
    this.isAutoStart = true,
    this.onTimeEnd,
  });

  @override
  State<TimerProgressIndicator> createState() => _TimerProgressIndicatorState();
}

class _TimerProgressIndicatorState extends State<TimerProgressIndicator>
    with TickerProviderStateMixin {
  final ValueNotifier<TimerState> _state = ValueNotifier(TimerState.stopped);

  late final AnimationController _progressController = AnimationController(
    value: 1,
    duration: Duration(seconds: widget.maxTimeInSecond),
    vsync: this,
  );

  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 1, end: 1.2).animate(
    CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
  );

  late final Animation<Color?> _colorAnimation = ColorTween(
    begin: Colors.red,
    end: Colors.white,
  ).animate(_progressController);

  @override
  void initState() {
    super.initState();
    widget.controller?._state = this;
    _progressController.addListener(_listenerProgressController);
    if (widget.isAutoStart!) {
      _startTimer();
    }
  }

  void _listenerProgressController() {
    if (_progressController.value <= 0.5) {
      if (!_scaleController.isAnimating) {
        _scaleController.repeat(reverse: true);
      }
    } else {
      _scaleController.stop();
    }
  }

  void _startTimer() {
    _state.value = TimerState.running;
    _progressController
        .reverse(from: _progressController.value)
        .whenComplete(() {
      _scaleController.stop();
      _state.value = TimerState.stopped;
      widget.onTimeEnd?.call();
    });
  }

  void _resetTimer() {
    _state.value = TimerState.stopped;
    _progressController.reset();
  }

  void _pauseTimer() {
    _state.value = TimerState.paused;
    _progressController.stop();
  }

  void _resumeTimer() {
    _startTimer();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progressController,
      builder: (BuildContext _, Widget? __) {
        return Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: _progressController.value,
              backgroundColor: Colors.white38,
              valueColor: _progressController.drive(
                ColorTween(
                  begin: Colors.red,
                  end: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Center(
              child: Transform.scale(
                scale: _scaleAnimation.value,
                alignment: Alignment.center,
                child: Text(
                  '${(_progressController.value * widget.maxTimeInSecond).ceil()}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: _colorAnimation.value,
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class TimerProgressController {
  _TimerProgressIndicatorState? _state;

  TimerState get state => _state?._state.value ?? TimerState.stopped;

  void start() {
    _state?._startTimer();
  }

  void reset() {
    _state?._resetTimer();
  }

  void pause() {
    _state?._pauseTimer();
  }

  void resume() {
    _state?._resumeTimer();
  }
}
