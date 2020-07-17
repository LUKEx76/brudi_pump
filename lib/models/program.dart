import 'package:brudi_pump/models/workout.dart';

class Program {
  String name;
  List<Workout> workouts;
  bool active;

  Program({this.name, this.workouts}) {
    if (this.workouts == null) {
      this.workouts = List<Workout>();
    }
    this.active = false;
  }

  List<Workout> getWorkoutsFromWeek(int weekIndex) {
    List<Workout> week = List<Workout>();
    for (var workout in this.workouts) {
      if (workout.inWeek == weekIndex) {
        week.add(workout);
      }
    }
    return week;
  }

  Workout get lastCompletedWorkout {
    Workout lastCompleted;
    for (var workout in this.workouts) {
      if (workout.completed) {
        lastCompleted = workout;
      }
    }
    if (lastCompleted == null) {
      lastCompleted = this.workouts[0];
    }
    return lastCompleted;
  }

  List<Workout> get focusedWorkouts {
    List<Workout> focused = List<Workout>();

    //Get Index of last Completed Workout
    int workoutIndex = this.workouts.indexOf(this.lastCompletedWorkout) ?? 0;

    //Get previous Workouts
    try {
      focused.add(this.workouts[workoutIndex - 1]);
      focused.add(this.workouts[workoutIndex - 2]);
    } catch (e) {
      print("GettingFocused -> Array out of Bounds Negativ!");
    }
    focused.add(this.lastCompletedWorkout);
    try {
      focused.add(this.workouts[workoutIndex + 1]);
      focused.add(this.workouts[workoutIndex + 2]);
    } catch (e) {
      print("GettingFocused -> Array out of Bounds Positiv!");
    }
    return focused;
  }

  int get programDurationInWeeks {
    int programDuration = 0;
    for (var workout in this.workouts) {
      if (workout.inWeek > programDuration) {
        programDuration = workout.inWeek;
      }
    }
    return programDuration;
  }
}
