import 'package:brudi_pump/models/workout.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class WorkoutScreen extends StatefulWidget {
  final Workout workout;

  WorkoutScreen({this.workout});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int exerciseIndex = 0;
  Timer timer;
  int secs = 100;

  void startTimer() {
    if (timer == null) {
      timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (secs < 1) {
              timer.cancel();
            } else {
              secs -= 1;
            }
          },
        ),
      );
    }
  }

  void toggleTimer() {
    if (timer != null) {
      timer.cancel();
    } else {
      startTimer();
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), //Show Progress of Workout, threedot Menu, no back btn
      body: SafeArea(
        child: Padding(
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
                Text("$secs"),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: RaisedButton(
                    child: Icon(
                      timer != null ? Icons.pause : Icons.play_arrow,
                      size: 50,
                    ),
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.brown),
                    ),
                    onPressed: () => toggleTimer(),
                  ),
                ),
                Text("Enter Reps?"), //Can Pull up?
              ],
            ),
          ),
        ),
      ),
    );
  }
}
