import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class RootView extends StatelessWidget {
  final Widget child;
  const RootView({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
