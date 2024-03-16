import 'package:workout_planner/features/workout/domain/models/workout.dart';

abstract class WorkoutRepository {
  Future<List<Workout>> getAllWorkouts();
  Future<void> createWorkout(Workout workout);
}
