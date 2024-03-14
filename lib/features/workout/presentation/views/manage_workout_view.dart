import 'package:flutter/material.dart';
import 'package:workout_planner/core/constants/app_dimens.dart';
import 'package:workout_planner/features/shared/widgets/custom_app_bar.dart';

import '../widgets/color_picker.dart';
import '../widgets/schedule_picker.dart';
import '../widgets/weekdays_picker.dart';

class ManageWorkoutView extends StatelessWidget {
  const ManageWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'New Workout'),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.layoutPadding),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16),
            const ColorPicker(),
            const SizedBox(height: 32),
            const SchedulePicker(),
            const SizedBox(height: 40),
            const WeekdaysPicker(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
