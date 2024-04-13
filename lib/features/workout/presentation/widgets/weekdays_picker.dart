import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../utils/extensions/weekday_abbreviation.dart';

class WeekdaysPicker extends StatefulWidget {
  final Map<String, bool> weekdays;
  const WeekdaysPicker({
    Key? key,
    required this.weekdays,
  }) : super(key: key);

  @override
  State<WeekdaysPicker> createState() => _WeekdaysPickerState();
}

class _WeekdaysPickerState extends State<WeekdaysPicker> {
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
            widget.weekdays.length,
            (index) {
              final isSelected = widget.weekdays.values.elementAt(index);
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      widget.weekdays.update(
                        widget.weekdays.keys.elementAt(index),
                        (value) {
                          return !value;
                        },
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : AppColors.lightSurface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.weekdays.keys.getWeekdayAbbreviation(index: index),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
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
