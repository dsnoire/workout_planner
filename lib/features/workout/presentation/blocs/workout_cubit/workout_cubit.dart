import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/repositories/workout_repository.dart';

import '../../../domain/models/workout.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final WorkoutRepository workoutRepository;
  WorkoutCubit(this.workoutRepository) : super(WorkoutLoaded(const []));

  Future<void> getAllWorkouts() async {
    try {
      emit(WorkoutLoading());
      final workouts = await workoutRepository.getAllWorkouts();
      if (workouts.isEmpty) {
        emit(WorkoutEmpty());
      } else {
        emit(WorkoutLoaded(workouts));
      }
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }

  Future<void> createWorkout(Workout workout) async {
    try {
      emit(WorkoutLoading());
      await workoutRepository.createWorkout(workout);
      await getAllWorkouts();
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }

  Future<void> deleteWorkout(Workout workout) async {
    try {
      emit(WorkoutLoading());
      await workoutRepository.deleteWorkout(workout);
      await getAllWorkouts();
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }

  Future<void> deleteAllWorkouts() async {
    try {
      emit(WorkoutLoading());
      await workoutRepository.deleteAllWorkouts();
      await getAllWorkouts();
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }
}
