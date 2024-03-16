part of 'workout_cubit.dart';

@immutable
sealed class WorkoutState {}

final class WorkoutLoading extends WorkoutState {}

final class WorkoutLoaded extends WorkoutState {
  final List<Workout> workouts;

  WorkoutLoaded(this.workouts);
}

final class WorkoutError extends WorkoutState {
  final String message;

  WorkoutError(this.message);
}

final class WorkoutEmpty extends WorkoutState {}
