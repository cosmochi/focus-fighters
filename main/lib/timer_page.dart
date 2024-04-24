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
  bool get wantKeepAlive => true; // Required for AutomaticKeepAliveClientMixin

  @override
  void initState() {
    super.initState();
    if (_timerManager.remainingTime == 0) {
      _timerManager.remainingTime = 60;  // Or another default starting time
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
            _timer = null;  // Make sure to nullify the timer
            _selectedTime = 0;  // Reset the selected time
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
      _timer = null;  // Nullify the timer here as well
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // This needs to be called when using AutomaticKeepAliveClientMixin
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
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 25),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(150, 0, 0, 0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                        size: 300,
                        angleRange: 360,
                        startAngle: 270,
                        customWidths: CustomSliderWidths(
                          trackWidth: 10,  // Increase the track width for better touch interaction
                          progressBarWidth: 15,  // Increase the progress bar width
                          shadowWidth: 0,
                        ),
                        customColors: CustomSliderColors(
                          trackColor: Colors.grey,
                          progressBarColor: Theme.of(context).primaryColor,
                          shadowColor: Colors.transparent,
                        ),
                        infoProperties: InfoProperties(
                          mainLabelStyle: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
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
                          _selectedTime = (value * 4).round() / 4;  // Ensures increments are in 0.25 (15 seconds)
                          _remainingTime = (_selectedTime * 60).toInt();
                        });
                      } : null,
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _isRunning ? _cancelTimer : _startTimer,
                  child: Text(
                    _isRunning ? 'Cancel' : 'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,  // Increased font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRunning ? Colors.red : Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
