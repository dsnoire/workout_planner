import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workout_planner/features/workout/domain/repositories/workout_repository.dart';

import '../../../domain/models/workout.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final WorkoutRepository workoutRepository;
  WorkoutCubit(this.workoutRepository) : super(WorkoutLoaded(const []));

  Future<void> getAllWorkouts() async {
    emit(WorkoutLoading());
    final workouts = await workoutRepository.getAllWorkouts();
    emit(WorkoutLoaded(workouts));
  }

  Future<void> createWorkout(Workout workout) async {
    try {
      emit(WorkoutLoading());
      await workoutRepository.createWorkout(workout);
      emit(WorkoutLoaded(await workoutRepository.getAllWorkouts()));
    } catch (e) {
      emit(WorkoutError(e.toString()));
    }
  }
}
