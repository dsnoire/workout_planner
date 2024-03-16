import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:workout_planner/features/workout/domain/models/workout.dart';
import 'package:workout_planner/features/workout/presentation/blocs/workout_cubit/workout_cubit.dart';
import 'package:workout_planner/features/workout/presentation/utils/extensions/weekday_abbreviation.dart';

import '../../../../core/constants/app_colors.dart';
import '../utils/workout_weekdays.dart';

class WorkoutListTile extends StatelessWidget {
  final Workout workout;
  const WorkoutListTile({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<WorkoutCubit>().deleteWorkout(workout);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.lightSurface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xC7D1D1D1),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(
                1,
                3,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  workout.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry>[];
                  },
                ),
              ],
            ),
            Text(
              'X',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                workoutWeekdays.length,
                (index) {
                  return CircleAvatar(
                    backgroundColor: AppColors.lightGrey,
                    child: Text(
                      workoutWeekdays.keys.getWeekdayAbbreviation(index: index),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
