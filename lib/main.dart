import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_planner/core/theme/app_theme.dart';
import 'package:workout_planner/features/workout/data/repositories/workout_repository_impl.dart';
import 'package:workout_planner/features/workout/domain/models/workout.dart';
import 'package:workout_planner/features/workout/presentation/blocs/workout_cubit/workout_cubit.dart';
import 'package:workout_planner/features/workout/presentation/views/manage_workout_view.dart';
import 'package:workout_planner/features/workout/presentation/views/workouts_view.dart';

late Isar isar;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [WorkoutSchema],
    directory: dir.path,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkoutCubit(WorkoutRepositoryImpl())..getAllWorkouts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Workout Planner',
        theme: AppTheme.theme,
        home: const WorkoutsView(),
      ),
    );
  }
}
