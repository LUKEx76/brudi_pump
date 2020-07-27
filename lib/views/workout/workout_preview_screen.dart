import 'package:brudi_pump/models/workout.dart';
import 'package:brudi_pump/views/workout/exercise_preview_card.dart';
import 'package:brudi_pump/views/workout/workout_screen.dart';
import 'package:flutter/material.dart';

class WorkoutPreviewScreen extends StatefulWidget {
  final Workout workout;

  WorkoutPreviewScreen({this.workout});

  @override
  _WorkoutPreviewScreenState createState() => _WorkoutPreviewScreenState();
}

class _WorkoutPreviewScreenState extends State<WorkoutPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Workout Preview")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  this.widget.workout.name,
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  this.widget.workout.workoutDuration,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: <Widget>[
                    Divider(thickness: 3),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true, //not sure
                        itemCount: this.widget.workout.exercises.length ?? 0,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              SizedBox(width: 8),
                              ExercisePreviewCard(
                                  exercise:
                                      this.widget.workout.exercises[index]),
                              SizedBox(width: 8),
                            ],
                          );
                        },
                      ),
                    ),
                    Divider(thickness: 3),
                  ],
                ),
                RaisedButton(
                  child: Text("START WORKOUT"),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WorkoutScreen(workout: this.widget.workout),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
