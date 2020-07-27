import 'package:brudi_pump/models/exercise.dart';
import 'package:flutter/material.dart';

class ExercisePreviewCard extends StatelessWidget {
  final Exercise exercise;

  ExercisePreviewCard({this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: exercise.imagePath.length == 0
                    ? Icon(Icons.accessibility_new)
                    : Image(
                        image: AssetImage(
                            "assets/images/exercises/" + exercise.imagePath)),
              ),
              Text(
                exercise.name,
                textAlign: TextAlign.center,
              ),
              Text(
                exercise.sets.toString() +
                    " x " +
                    exercise.timePerSetInSec.toString() +
                    " sec",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
