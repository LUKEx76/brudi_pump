import 'package:brudi_pump/animations/timer_painter.dart';
import 'package:brudi_pump/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WorkoutScreen extends StatefulWidget {
  final Workout workout;

  WorkoutScreen({this.workout});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  bool paused;
  int exerciseIndex = 0;
  int secs = 20;

  @override
  void initState() {
    super.initState();
    paused = false;
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: secs));
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    controller.addListener(() {
      print(controller.status);
      if (controller.isDismissed) {
        nextSet();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void toggleTimer() {
    if (controller.isAnimating) {
      controller.stop();
      setState(() => paused = true);
    } else {
      controller.reverse(
          from: controller.value == 0.0 ? 1.0 : controller.value);
      setState(() => paused = false);
    }
  }

  void nextSet() {
    SystemSound.play(SystemSoundType.click);
    print("next Set");
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(), //Show Progress of Workout, threedot Menu, no back btn
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return CustomPaint(
                  painter: TimerPainter(
                    animation: controller,
                    backgroundColor: Colors.white,
                    foregroundColor: themeData.indicatorColor,
                    width: _width,
                    height: _height,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(this.widget.workout.exercises[exerciseIndex].name),
                    Text("Reps"),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: this
                                  .widget
                                  .workout
                                  .exercises[exerciseIndex]
                                  .imagePath
                                  .length ==
                              0
                          ? Icon(Icons.accessibility_new)
                          : Image(
                              image: AssetImage("assets/images/exercises/" +
                                  this
                                      .widget
                                      .workout
                                      .exercises[exerciseIndex]
                                      .imagePath),
                            ),
                    ),
                    AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget child) {
                          return Text(
                            timerString,
                            style: themeData.textTheme.headline1,
                          );
                        }),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: FloatingActionButton(
                        child: Icon(
                          paused ? Icons.play_arrow : Icons.pause,
                          size: 50,
                        ),
                        onPressed: () => toggleTimer(),
                      ),
                    ),
                    Text("Enter Reps?"), //Pull up from Button of the Screen?
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
