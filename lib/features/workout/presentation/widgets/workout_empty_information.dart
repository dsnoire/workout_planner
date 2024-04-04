import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';

class WorkoutEmptyInfomation extends StatelessWidget {
  const WorkoutEmptyInfomation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/empty_state.svg',
            height: 220,
          ),
          const SizedBox(height: 16),
          Text(
            "You don't have any workouts yet",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.grey),
          )
        ],
      ),
    );
  }
}
