import 'package:flutter/material.dart';

import '../utils/workout_colors.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        scrollDirection: Axis.horizontal,
        itemCount: workoutColors.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: workoutColors.keys.elementAt(index),
            ),
          );
        },
      ),
    );
  }
}
