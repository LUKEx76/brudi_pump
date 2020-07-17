import 'package:brudi_pump/models/workout.dart';
import 'package:brudi_pump/views/workout/workout_screen.dart';
import 'package:flutter/material.dart';

class WorkoutCardExpanded extends StatelessWidget {
  final Workout workout;

  WorkoutCardExpanded({this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.workout.name),
        subtitle: Column(
          children: <Widget>[
            for (var i = 0; i < this.workout.exercises.length; i++)
              if (i % 2 == 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(workout.exercises[i].name),
                    Text(""),
                    Text(workout.exercises[i + 1].name),
                    Text(""),
                  ],
                ),
          ],
        ),
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
