import 'package:brudi_pump/models/program.dart';
import 'package:brudi_pump/models/workout.dart';
import 'package:brudi_pump/views/home/workout_card_expanded.dart';
import 'package:flutter/material.dart';

class WeekCard extends StatelessWidget {
  final Program program;
  final int weekIndex;

  WeekCard({this.program, this.weekIndex});
  @override
  Widget build(BuildContext context) {
    List<Workout> workouts = program.getWorkoutsFromWeek(weekIndex);

    return Card(
      elevation: 5,
      color: Colors.blue[100],
      child: Column(
        children: <Widget>[
          Text("Week " + (this.weekIndex + 1).toString()),
          for (var i = 0; i < workouts.length; i++)
            Container(
              child: Column(
                children: <Widget>[
                  if (this.program.focusedWorkouts.contains(workouts[i]))
                    WorkoutCard(workout: workouts[i], isFocused: true)
                  else
                    WorkoutCard(workout: workouts[i], isFocused: false),
                  if (i + 1 < workouts.length) Divider(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/*
ExpansionPanelList(
          children: week.workouts.map<ExpansionPanel>((Workout workout) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return WorkoutCard(workout: workout);
              },
              body: Text("Hi"),
            );
          }).toList(),
        ),
*/
