import 'package:flutter/material.dart';
import 'package:workout_planner/features/shared/widgets/custom_app_bar.dart';

class ManageWorkoutView extends StatelessWidget {
  const ManageWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'New Workout'),
      body: TextField(),
    );
  }
}
