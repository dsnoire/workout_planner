import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/workout/data/repositories/workout_repository_impl.dart';
import 'features/workout/domain/models/workout.dart';
import 'features/workout/presentation/blocs/workout_cubit/workout_cubit.dart';

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
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Workout Planner',
        theme: AppTheme.theme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
