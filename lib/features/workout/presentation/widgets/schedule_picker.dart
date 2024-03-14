import 'package:flutter/material.dart';
import 'package:workout_planner/core/constants/app_colors.dart';
import 'package:workout_planner/features/workout/presentation/utils/enums/schedule_enum.dart';

class SchedulePicker extends StatelessWidget {
  const SchedulePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Schedule',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        DecoratedBox(
          decoration: BoxDecoration(
            // border: Border.all(
            //   color: Colors.black,
            //   width: 0.7,
            // ),
            color: AppColors.lightSurface,
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButton<ScheduleEnum>(
            isExpanded: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 5,
            ),
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            dropdownColor: AppColors.lightSurface,
            value: ScheduleEnum.fullBody,
            items: ScheduleEnum.values.map(
              (schedule) {
                return DropdownMenuItem(
                  value: schedule,
                  child: Text(
                    schedule.name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                );
              },
            ).toList(),
            onChanged: (x) {},
          ),
        ),
      ],
    );
  }
}
