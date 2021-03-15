import 'dart:async';
import 'package:flutter/material.dart';

class TimerBar extends StatefulWidget {
  TimerBar({Key key, this.onFinish, this.isCurrent, this.hasPassed = false})
      : super(key: key);

  final BorderRadius borderRadius = BorderRadius.circular(100);
  final Function() onFinish;
  final bool isCurrent;
  final bool hasPassed;

  @override
  _TimerBarState createState() => _TimerBarState();
}

class _TimerBarState extends State<TimerBar> {
  static const _finishTime = 3000;
  static const _nMiliSeconds = 50;

  Timer _timer;
  int _currentTime = 0;

  void startTimer() {
    _timer = new Timer.periodic(
      Duration(milliseconds: _nMiliSeconds),
      (Timer timer) {
        if (_currentTime >= _finishTime) {
          setState(() {
            timer.cancel();
            _currentTime = 0;
            _timer = null;
            widget.onFinish();
          });
        } else {
          setState(() {
            _currentTime += _nMiliSeconds;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if (widget.isCurrent && _timer == null) startTimer();
    return Container(
      height: 2,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.4),
        borderRadius: widget.borderRadius,
      ),
      clipBehavior: Clip.hardEdge,
      child: FractionallySizedBox(
        widthFactor: widget.hasPassed ? 1 : _currentTime / _finishTime,
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
