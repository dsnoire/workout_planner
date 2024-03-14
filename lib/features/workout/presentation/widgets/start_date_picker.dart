import 'package:flutter/material.dart';

class StartDatePicker extends StatelessWidget {
  const StartDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Start date',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: Text(
              '${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}'),
          onTap: () {
            showDatePicker(
              context: context,
              firstDate: DateTime(2024),
              lastDate: DateTime(2050),
            );
          },
        ),
      ],
    );
  }
}
