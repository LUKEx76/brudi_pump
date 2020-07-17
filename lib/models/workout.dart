import 'package:brudi_pump/models/exercise.dart';

class Workout {
  String name;
  List<Exercise> exercises;
  int inWeek;
  bool completed;

  Workout({this.name, this.exercises, this.inWeek}) {
    if (this.exercises == null) {
      this.exercises = List<Exercise>();
    }
    this.completed = false;
  }

  String get workoutDuration {
    int timeInSec = 0;
    for (var exercise in exercises) {
      timeInSec += exercise.timePerSetInSec * exercise.sets;
    }
    int hours = (timeInSec / 3600).floor();
    int minutes = ((timeInSec % 3600) / 60).floor();
    return hours.toString() + "h " + minutes.toString() + "min";
  }
}
