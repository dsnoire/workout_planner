import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_colors.dart';

class BottomNavigationBarItemIcon extends StatelessWidget {
  const BottomNavigationBarItemIcon({
    Key? key,
    required this.path,
    this.color,
  }) : super(key: key);

  final String path;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 28,
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(
          color ?? AppColors.grey,
          BlendMode.srcIn,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
