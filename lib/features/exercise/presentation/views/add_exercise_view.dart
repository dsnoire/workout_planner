import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimens.dart';
import '../../../shared/widgets/custom_app_bar.dart';
import '../widgets/sets_text_field.dart';

class AddExerciseView extends StatefulWidget {
  const AddExerciseView({super.key});

  @override
  State<AddExerciseView> createState() => _AddExerciseViewState();
}

class _AddExerciseViewState extends State<AddExerciseView> {
  late final TextEditingController nameController;
  bool value = false;

  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Exercise'),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.layoutPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Exercise name'),
              ),
              const SizedBox(height: 32),
              Column(
                children: [
                  Text(
                    'Sets',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SetsTextField(label: 'Sets'),
                      SetsTextField(label: 'Reps'),
                      SetsTextField(label: 'RIR')
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rest time between sets',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Switch(
                        value: value,
                        onChanged: (bool newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  if (value)
                    CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.ms,
                      onTimerDurationChanged: (Duration newDuration) {
                        print(newDuration);
                      },
                    ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
