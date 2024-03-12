import 'package:flutter/material.dart';
import 'package:workout_planner/core/theme/app_theme.dart';
import 'package:workout_planner/features/workout/presentation/views/workouts_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout Planner',
      theme: AppTheme.theme,
      home: const WorkoutsView(),
    );
  }
}
