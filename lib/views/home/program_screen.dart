import 'package:brudi_pump/models/exercise.dart';
import 'package:brudi_pump/models/program.dart';
import 'package:brudi_pump/models/workout.dart';
import 'package:brudi_pump/views/home/week_card.dart';
import 'package:flutter/material.dart';

class ProgramScreen extends StatefulWidget {
  @override
  _ProgramScreenState createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  @override
  Widget build(BuildContext context) {
    //Creation of a Test Workout
    Exercise pushUps = Exercise(name: "Push Ups", sets: 3, timePerSetInSec: 90);
    Exercise squats = Exercise(name: "Squats", sets: 3, timePerSetInSec: 90);
    Exercise pullUps = Exercise(name: "Pull Ups", sets: 3, timePerSetInSec: 90);
    Exercise crunches =
        Exercise(name: "Crunches", sets: 3, timePerSetInSec: 90);

    List<Exercise> exerciseList1 = List<Exercise>();
    exerciseList1.add(pushUps);
    exerciseList1.add(squats);
    exerciseList1.add(pushUps);
    exerciseList1.add(squats);
    exerciseList1.add(pushUps);
    exerciseList1.add(squats);
    exerciseList1.add(pushUps);
    exerciseList1.add(squats);
    List<Exercise> exerciseList2 = List<Exercise>();
    exerciseList2.add(pullUps);
    exerciseList2.add(crunches);

    Workout w1 =
        Workout(name: "Easy Push-Legs", exercises: exerciseList1, inWeek: 0);
    Workout w2 =
        Workout(name: "Easy Pull-Core", exercises: exerciseList2, inWeek: 0);
    Workout w3 = Workout(name: "Leg Day", exercises: exerciseList1, inWeek: 1);
    Workout w4 = Workout(name: "Arms", exercises: exerciseList2, inWeek: 1);
    Workout w5 = Workout(name: "Deload", exercises: exerciseList1, inWeek: 2);
    Workout w6 =
        Workout(name: "Strength Focus", exercises: exerciseList2, inWeek: 2);
    List<Workout> workoutList = List<Workout>();
    workoutList.add(w1);
    workoutList.add(w2);
    workoutList.add(w3);
    workoutList.add(w4);
    workoutList.add(w5);
    workoutList.add(w6);

    Program activeProgram =
        Program(name: "Test Program", workouts: workoutList);
    activeProgram.workouts[0].completed = true;
    // --

    return Scaffold(
      appBar: AppBar(title: Text("brudi_pump")),
      backgroundColor: Colors.grey[300],
      body: activeProgram.workouts.length == 0
          ? Center(child: Text("No Program selected"))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: ListView(
                children: <Widget>[
                  for (var i = 0;
                      i <= activeProgram.programDurationInWeeks;
                      i++)
                    Container(
                      child: Column(
                        children: <Widget>[
                          WeekCard(program: activeProgram, weekIndex: i),
                          //SizedBox(height: 10),
                          if (i < activeProgram.programDurationInWeeks)
                            Divider(color: Colors.black, thickness: 2),
                        ],
                      ),
                    ),
                ],
              ),
            ),
    );
  }
}
