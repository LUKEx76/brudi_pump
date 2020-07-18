import 'package:brudi_pump/models/workout.dart';
import 'package:brudi_pump/views/workout/workout_preview_screen.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatefulWidget {
  final Workout workout;
  final bool isFocused;

  WorkoutCard({this.workout, this.isFocused});

  @override
  _WorkoutCardState createState() => _WorkoutCardState();
}

class _WorkoutCardState extends State<WorkoutCard> {
  bool isExpanded;

  @override
  void initState() {
    this.isExpanded = this.widget.isFocused;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(this.widget.workout.name),
              trailing: widget.workout.completed
                  ? Icon(Icons.done)
                  : Text(this.widget.workout.workoutDuration),
            ),
            if (this.isExpanded)
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 2,
                spacing: 40,
                children: <Widget>[
                  for (var i = 0; i < this.widget.workout.exercises.length; i++)
                    Chip(
                      label: Text(widget.workout.exercises[i].name +
                          "   " +
                          widget.workout.exercises[i].sets.toString() +
                          "x" +
                          widget.workout.exercises[i].timePerSetInSec
                              .toString() +
                          "sec"),
                    ),
                ],
              ),
          ],
        ),
        onTap: () {
          if (this.isExpanded) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    WorkoutPreviewScreen(workout: this.widget.workout),
              ),
            );
          } else {
            setState(() {
              isExpanded = true;
            });
          }
        },
        onLongPress: () => print("TODO: Info of Workout PopUp"),
      ),
    );
  }
}

/*
Column(
                children: <Widget>[
                  for (var i = 0; i < this.widget.workout.exercises.length; i++)
                    if (i % 2 == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Chip(
                            label: Text(widget.workout.exercises[i].name +
                                "   " +
                                widget.workout.exercises[i].sets.toString() +
                                "x" +
                                widget.workout.exercises[i].timePerSetInSec
                                    .toString() +
                                "sec"),
                          ),
                          //Text(widget.workout.exercises[i].name),
                          SizedBox(width: 1),
                          Chip(
                            label: Text(widget.workout.exercises[i + 1].name +
                                "   " +
                                widget.workout.exercises[i + 1].sets
                                    .toString() +
                                "x" +
                                widget.workout.exercises[i + 1].timePerSetInSec
                                    .toString() +
                                "sec"),
                          ),
                          SizedBox(width: 1),
                        ],
                      ),
                ],
              )
*/
