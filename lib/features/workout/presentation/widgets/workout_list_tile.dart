import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/models/workout.dart';
import '../blocs/workout_cubit/workout_cubit.dart';
import '../utils/extensions/weekday_abbreviation.dart';
import '../utils/workout_weekdays.dart';
import '../views/manage_workout_view.dart';

class WorkoutListTile extends StatelessWidget {
  final Workout workout;
  const WorkoutListTile({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ManageWorkoutView(
                  workout: workout,
                )));
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
              workout.schedule.name,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                workoutWeekdays.length,
                (index) {
                  final isSelected = workout.weekdays.contains(
                    workoutWeekdays.keys.elementAt(index),
                  );
                  return CircleAvatar(
                    backgroundColor: Color(
                      isSelected ? workout.color : AppColors.lightGrey.value,
                    ),
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
