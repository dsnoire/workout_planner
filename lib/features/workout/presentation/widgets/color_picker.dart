import 'package:flutter/material.dart';
import '../utils/workout_colors.dart';

class ColorPicker extends StatefulWidget {
  final Map<int, bool> colors;
  const ColorPicker({
    Key? key,
    required this.colors,
  }) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        scrollDirection: Axis.horizontal,
        itemCount: widget.colors.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.colors.updateAll((key, value) {
                  if (workoutColors.keys.elementAt(index) == key) {
                    return true;
                  } else {
                    return false;
                  }
                });
              });
            },
            child: CircleAvatar(
              backgroundColor: Color(widget.colors.keys.elementAt(index)),
              child: widget.colors.values.elementAt(index)
                  ? const Icon(Icons.check)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
