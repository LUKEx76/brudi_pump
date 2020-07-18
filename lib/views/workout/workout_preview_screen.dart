import 'package:brudi_pump/models/workout.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  this.widget.workout.name,
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  this.widget.workout.workoutDuration,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Divider(thickness: 3),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true, //not sure
                    itemCount: this.widget.workout.exercises.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Text("Test"),
                      );
                      /*Card(
                        elevation: 5,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.accessibility_new),
                              Text(this.widget.workout.exercises[index].name),
                            ],
                          ),
                        ),
                      );*/
                    },
                  ),
                ),
                Divider(thickness: 3),
                RaisedButton(
                  child: Text("START WORKOUT"),
                  onPressed: () => print("Start Workout"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
