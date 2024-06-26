import 'package:flutter/material.dart';

import '../../domain/models/workout.dart';
import 'workout_list_tile.dart';

class WorkoutsListView extends StatelessWidget {
  final List<Workout> workouts;
  const WorkoutsListView({
    Key? key,
    required this.workouts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(
          bottom: 16,
          right: 4,
          left: 4,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: workouts.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return WorkoutListTile(workout: workouts[index]);
        },
      ),
    );
  }
}
