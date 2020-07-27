import 'package:brudi_pump/models/workout.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  final Workout workout;

  WorkoutScreen({this.workout});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(this.widget.workout.name),
      ),
    );
  }
}
