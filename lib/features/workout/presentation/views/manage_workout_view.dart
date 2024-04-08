import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../../domain/models/workout.dart';
import '../blocs/workout_cubit/workout_cubit.dart';
import '../utils/enums/schedule_enum.dart';
import '../utils/workout_colors.dart';
import '../utils/workout_weekdays.dart';
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
  late TextEditingController nameController;
  late Map<int, bool> colors;
  late ScheduleEnum schedule;
  late DateTime date;
  late Map<String, bool> weekdays;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.workout?.name);
    initializeValues();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void initializeValues() {
    if (widget.workout == null) {
      colors = workoutColors..updateAll((key, value) => false);
      schedule = ScheduleEnum.fullBody;
      date = DateTime.now();
      weekdays = workoutWeekdays..updateAll((key, value) => false);
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
      date = widget.workout!.date;
      weekdays = workoutWeekdays
        ..updateAll((key, value) {
          if (widget.workout!.weekdays.any((element) => element == key)) {
            return true;
          } else {
            return false;
          }
        });
    }
  }

  Future<void> addWorkout() async {
    final color = colors.entries
        .firstWhere((element) => element.value == true,
            orElse: () => workoutColors.entries.first)
        .key;
    final workout = Workout()
      ..name = nameController.text
      ..color = color
      ..schedule = schedule
      ..date = date
      ..weekdays = weekdays.entries
          .where((element) => element.value == true)
          .map((e) => e.key)
          .toList();

    await context.read<WorkoutCubit>().createWorkout(workout);
  }

  @override
  Widget build(BuildContext context) {
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
                  });
                }),
            const SizedBox(height: 32),
            StartDatePicker(
                date: date,
                onChanged: (DateTime newDate) {
                  setState(() {
                    date = newDate;
                  });
                }),
            const SizedBox(height: 32),
            WeekdaysPicker(weekdays: weekdays),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                await addWorkout();
                if (context.mounted) Navigator.of(context).pop();
              },
              child: const Text('Add Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
