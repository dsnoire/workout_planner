import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StartDatePicker extends StatefulWidget {
  final DateTime date;
  final Function(DateTime date) onChanged;
  const StartDatePicker({
    Key? key,
    required this.date,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<StartDatePicker> createState() => _StartDatePickerState();
}

class _StartDatePickerState extends State<StartDatePicker> {
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
          title: Text(DateFormat().add_yMMMd().format(widget.date)),
          onTap: () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              firstDate: DateTime(2024),
              lastDate: DateTime(2050),
            );
            if (selectedDate != null) {
              widget.onChanged(selectedDate);
            }
          },
        ),
      ],
    );
  }
}
