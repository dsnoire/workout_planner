import 'package:flutter/material.dart';
import 'package:workout_planner/core/constants/app_colors.dart';
import 'package:workout_planner/features/workout/presentation/utils/extensions/weekday_abbreviation.dart';
import 'package:workout_planner/features/workout/presentation/utils/workout_weekdays.dart';

class WeekdaysPicker extends StatelessWidget {
  const WeekdaysPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weekdays',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            workoutWeekdays.length,
            (index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightSurface,
                    border: Border.all(
                      color: const Color(0xFFFFFFFF),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    workoutWeekdays.keys.getWeekdayAbbreviation(index: index),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
