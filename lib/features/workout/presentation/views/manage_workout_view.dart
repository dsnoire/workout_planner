import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_planner/core/constants/app_dimens.dart';
import 'package:workout_planner/features/shared/widgets/custom_app_bar.dart';
import 'package:workout_planner/features/workout/domain/models/workout.dart';
import 'package:workout_planner/features/workout/presentation/blocs/workout_cubit/workout_cubit.dart';

import '../widgets/color_picker.dart';
import '../widgets/schedule_picker.dart';
import '../widgets/start_date_picker.dart';
import '../widgets/weekdays_picker.dart';

class ManageWorkoutView extends StatelessWidget {
  const ManageWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'New Workout'),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.layoutPadding),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16),
            const ColorPicker(),
            const SizedBox(height: 32),
            const SchedulePicker(),
            const SizedBox(height: 32),
            const StartDatePicker(),
            const SizedBox(height: 32),
            const WeekdaysPicker(),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                final workout = Workout()..name = nameController.text;
                await context.read<WorkoutCubit>().createWorkout(workout);
                Navigator.of(context).pop();
              },
              child: const Text('Add Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
