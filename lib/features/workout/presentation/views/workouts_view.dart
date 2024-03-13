import 'package:flutter/material.dart';
import 'package:workout_planner/core/constants/app_dimens.dart';
import 'package:workout_planner/features/workout/presentation/views/manage_workout_view.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../widgets/workouts_list_view.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Workouts',
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.layoutPadding),
        child: Column(
          children: [
            const WorkoutsListView(),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const ManageWorkoutView(),
                ),
              ),
              child: const Text('New Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
