import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../utils/enums/schedule_enum.dart';

class SchedulePicker extends StatelessWidget {
  final ScheduleEnum schedule;
  final Function(ScheduleEnum?) onChanged;
  const SchedulePicker({
    Key? key,
    required this.schedule,
    required this.onChanged,
  }) : super(key: key);

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
            value: schedule,
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
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
