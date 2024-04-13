import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/workout.dart';
import '../blocs/workout_cubit/workout_cubit.dart';
import '../utils/enums/action_enum.dart';

class WorkoutActionMenu extends StatelessWidget {
  const WorkoutActionMenu({
    super.key,
    required this.workout,
  });

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ActionEnum>(
      iconSize: 19,
      onSelected: (ActionEnum action) async {
        if (action == ActionEnum.edit) {
          context.push(
            '/edit-workout',
            extra: workout,
          );
        } else if (action == ActionEnum.delete) {
          await context.read<WorkoutCubit>().deleteWorkout(workout);
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<ActionEnum>>[
          const PopupMenuItem<ActionEnum>(
            value: ActionEnum.edit,
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 9),
                Text('Edit'),
              ],
            ),
          ),
          const PopupMenuItem<ActionEnum>(
            value: ActionEnum.delete,
            child: Row(
              children: [
                Icon(Icons.delete),
                SizedBox(width: 9),
                Text('Delete'),
              ],
            ),
          ),
        ];
      },
    );
  }
}
