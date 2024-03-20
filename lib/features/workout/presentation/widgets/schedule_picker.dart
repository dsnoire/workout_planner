import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../utils/enums/schedule_enum.dart';

class SchedulePicker extends StatefulWidget {
  ScheduleEnum schedule;
  SchedulePicker({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  State<SchedulePicker> createState() => _SchedulePickerState();
}

class _SchedulePickerState extends State<SchedulePicker> {
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
            value: widget.schedule,
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
            onChanged: (ScheduleEnum? schedule) {
              setState(() {
                widget.schedule = schedule!;
              });
            },
          ),
        ),
      ],
    );
  }
}
