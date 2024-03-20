import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_dimens.dart';
import 'manage_workout_view.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../blocs/workout_cubit/workout_cubit.dart';
import '../widgets/workouts_list_view.dart';

class WorkoutsView extends StatelessWidget {
  const WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Workouts',
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<WorkoutCubit>().deleteAllWorkouts();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.layoutPadding),
        child: Column(
          children: [
            BlocBuilder<WorkoutCubit, WorkoutState>(
              builder: (context, state) {
                switch (state) {
                  case WorkoutLoading():
                    return const Center(child: CircularProgressIndicator());
                  case WorkoutLoaded():
                    return WorkoutsListView(workouts: state.workouts);
                  case WorkoutError():
                    return Center(child: Text(state.message));
                  case WorkoutEmpty():
                    return const Center(child: Text('No workouts'));
                }
              },
            ),
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
