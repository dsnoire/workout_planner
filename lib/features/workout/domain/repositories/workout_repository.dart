import '../models/workout.dart';

abstract class WorkoutRepository {
  Future<List<Workout>> getAllWorkouts();
  Future<void> createWorkout(Workout workout);
  Future<void> deleteWorkout(Workout workout);
  Future<void> deleteAllWorkouts();
}
