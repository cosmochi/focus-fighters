import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'timer_manager.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with AutomaticKeepAliveClientMixin {
  final TimerManager _timerManager = TimerManager.instance;
  Timer? _timer;
  int _remainingTime = 0;
  double _selectedTime = 0;
  bool _isRunning = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    if (_timerManager.remainingTime == 0) {
      _timerManager.remainingTime = 60;
    }
  }

  void _startTimer() {
    if (!_isRunning && _selectedTime > 0) {
      setState(() {
        _isRunning = true;
        _remainingTime = (_selectedTime * 60).round();
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_remainingTime > 0) {
          setState(() {
            _remainingTime--;
            _selectedTime = _remainingTime / 60;
          });
        } else {
          _timer?.cancel();
          setState(() {
            _isRunning = false;
            _timer = null;
            _selectedTime = 0;
          });
        }
      });
    }
  }

  void _cancelTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _remainingTime = 0;
      _selectedTime = 0;
      _timer = null;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/timer_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  _isRunning ? 'assets/images/timer_gif.gif' : 'assets/images/timer_freeze.png',
                  width: 175,
                  height: 175,
                ),
                SizedBox(height: 15),
                Container(
                  width: 275,
                  height: 275,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(150, 0, 0, 0),
                    shape: BoxShape.circle,
                  ),
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      size: 275,
                      angleRange: 360,
                      startAngle: 270,
                      customWidths: CustomSliderWidths(
                        trackWidth: 10,
                        progressBarWidth: 15,
                        shadowWidth: 0,
                      ),
                      customColors: CustomSliderColors(
                        trackColor: Colors.grey,
                        progressBarColor: Theme.of(context).primaryColor,
                        shadowColor: Colors.transparent,
                      ),
                      infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                          fontFamily: 'Pixel',
                        ),
                        modifier: (double value) {
                          final minutes = (_remainingTime / 60).floor();
                          final seconds = _remainingTime % 60;
                          return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                        },
                      ),
                    ),
                    min: 0,
                    max: 60,
                    initialValue: _selectedTime,
                    onChange: (!_isRunning) ? (double value) {
                      setState(() {
                        _selectedTime = (value * 4).round() / 4;
                        _remainingTime = (_selectedTime * 60).toInt();
                      });
                    } : null,
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: _isRunning ? _cancelTimer : _startTimer,
                  child: Text(
                    _isRunning ? 'Cancel' : 'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontFamily: 'Pixel',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRunning ? Colors.red : Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -30), // Negative Y offset to move the image upwards
                  child: Image.asset(
                    _isRunning ? 'assets/images/hero1_fight.gif' : 'assets/images/hero1.gif',
                    width: 300,
                    height: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
