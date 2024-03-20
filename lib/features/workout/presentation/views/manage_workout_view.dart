import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../domain/models/workout.dart';
import '../blocs/workout_cubit/workout_cubit.dart';
import '../utils/enums/schedule_enum.dart';
import '../utils/workout_colors.dart';
import '../widgets/color_picker.dart';
import '../widgets/schedule_picker.dart';
import '../widgets/start_date_picker.dart';
import '../widgets/weekdays_picker.dart';

class ManageWorkoutView extends StatefulWidget {
  final Workout? workout;
  const ManageWorkoutView({
    Key? key,
    this.workout,
  }) : super(key: key);

  @override
  State<ManageWorkoutView> createState() => _ManageWorkoutViewState();
}

class _ManageWorkoutViewState extends State<ManageWorkoutView> {
  late Map<int, bool> colors;
  late ScheduleEnum schedule;

  @override
  void initState() {
    if (widget.workout == null) {
      schedule = ScheduleEnum.fullBody;
      colors = workoutColors..updateAll((key, value) => false);
    } else {
      colors = workoutColors
        ..updateAll(
          (key, value) {
            if (key == widget.workout!.color) {
              return true;
            } else {
              return false;
            }
          },
        );
      schedule = widget.workout!.schedule;
    }
    super.initState();
  }

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
            ColorPicker(colors: colors),
            const SizedBox(height: 32),
            SchedulePicker(
                schedule: schedule,
                onChanged: (ScheduleEnum? value) {
                  setState(() {
                    schedule = value!;
                    print(schedule);
                  });
                }),
            const SizedBox(height: 32),
            const StartDatePicker(),
            const SizedBox(height: 32),
            const WeekdaysPicker(),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                final color = colors.entries
                    .firstWhere((element) => element.value == true,
                        orElse: () => workoutColors.entries.first)
                    .key;
                final workout = Workout()
                  ..name = nameController.text
                  ..color = color
                  ..schedule = schedule;

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
