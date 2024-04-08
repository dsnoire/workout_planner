import 'package:isar/isar.dart';
import '../../domain/models/workout.dart';
import '../../domain/repositories/workout_repository.dart';
import '../../../../main.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  @override
  Future<List<Workout>> getAllWorkouts() async {
    return isar.workouts.where().findAll();
  }

  @override
  Future<void> createWorkout(Workout workout) async {
    await isar.writeTxn(() async => await isar.workouts.put(workout));
  }

  @override
  Future<void> updateWorkout(Workout workout) async {
    await isar.writeTxn(
      () async {
        final workoutById = await isar.workouts.get(workout.id);
        if (workoutById != null) {
          return isar
              .writeTxn(() async => await isar.workouts.put(workoutById));
        }
      },
    );
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
