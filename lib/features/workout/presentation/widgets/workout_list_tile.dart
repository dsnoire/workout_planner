import 'package:flutter/material.dart';
import 'package:workout_planner/features/workout/presentation/utils/extensions/weekday_abbreviation.dart';

import '../../../../core/constants/app_colors.dart';
import '../utils/workout_weekdays.dart';

class WorkoutListTile extends StatelessWidget {
  const WorkoutListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
                'Workout name',
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
            'FBW',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              workoutWeekdays.length,
              (index) {
                return CircleAvatar(
                  backgroundColor: AppColors.background,
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
    );
  }
}
