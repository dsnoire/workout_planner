import 'package:flutter/material.dart';
import 'package:workout_planner/core/constants/app_colors.dart';
import 'package:workout_planner/features/workout/presentation/utils/enums/schedule_enum.dart';

class SchedulePicker extends StatelessWidget {
  const SchedulePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Schedule',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 16),
        DecoratedBox(
          decoration: BoxDecoration(
            // border: Border.all(
            //   color: Colors.black,
            //   width: 0.7,
            // ),
            color: AppColors.background,
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
            dropdownColor: AppColors.background,
            value: ScheduleEnum.fullBody,
            items: ScheduleEnum.values.map(
              (schedule) {
                return DropdownMenuItem(
                  value: schedule,
                  child: Center(
                    child: Text(
                      schedule.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
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
