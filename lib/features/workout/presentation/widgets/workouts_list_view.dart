import 'package:flutter/material.dart';
import 'workout_list_tile.dart';

class WorkoutsListView extends StatelessWidget {
  const WorkoutsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.separated(
        padding: const EdgeInsets.only(
          bottom: 16,
          right: 4,
          left: 4,
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: 24,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return const WorkoutListTile();
        },
      ),
    );
  }
}
