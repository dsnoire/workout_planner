import 'package:isar/isar.dart';
import 'package:workout_planner/features/workout/domain/models/workout.dart';
import 'package:workout_planner/features/workout/domain/repositories/workout_repository.dart';
import 'package:workout_planner/main.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  @override
  Future<List<Workout>> getAllWorkouts() async {
    return await isar.workouts.where().findAll();
  }

  @override
  Future<void> createWorkout(Workout workout) async {
    await isar.writeTxn(() async => await isar.workouts.put(workout));
  }

  @override
  Future<void> deleteWorkout(Workout workout) async {
    await isar.writeTxn(() async => await isar.workouts.delete(workout.id));
  }

  @override
  Future<void> deleteAllWorkouts() async {
    await isar.writeTxn(() async => await isar.workouts.clear());
  }
}
