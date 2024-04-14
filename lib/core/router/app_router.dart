import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/exercise/presentation/views/add_exercise_view.dart';
import '../../features/home/home_view.dart';
import '../../features/shared/views/root_view.dart';
import '../../features/statistics/statistics_view.dart';
import '../../features/workout/domain/models/workout.dart';
import '../../features/workout/presentation/views/manage_workout_view.dart';
import '../../features/workout/presentation/views/workout_view.dart';
import '../../features/workout/presentation/views/workouts_view.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/new-workout',
        builder: (context, state) => const ManageWorkoutView(),
      ),
      GoRoute(
        path: '/edit-workout',
        builder: (context, state) => ManageWorkoutView(
          workout: state.extra as Workout,
        ),
      ),
      GoRoute(
        path: '/workout',
        builder: (context, state) => WorkoutView(
          workout: state.extra as Workout,
        ),
      ),
      GoRoute(
        path: '/add-exercise',
        builder: (context, state) => const AddExerciseView(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (
          context,
          state,
          child,
        ) =>
            RootView(
          key: state.pageKey,
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeView(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/workouts',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: WorkoutsView(
                  key: state.pageKey,
                ),
              );
            },
          ),
          GoRoute(
            path: '/statistics',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: StatisticsView(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
