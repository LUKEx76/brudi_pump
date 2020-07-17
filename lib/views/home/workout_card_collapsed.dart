import 'package:brudi_pump/models/workout.dart';
import 'package:brudi_pump/views/workout/workout_screen.dart';
import 'package:flutter/material.dart';

class WorkoutCardCollapsed extends StatelessWidget {
  final Workout workout;

  WorkoutCardCollapsed({this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.workout.name),
        trailing: workout.completed
            ? Icon(Icons.done)
            : Text(this.workout.workoutDuration),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutScreen(workout: this.workout),
          ),
        ),
        onLongPress: () => print("TODO: Info of Workout PopUp"),
      ),
    );
  }
}
