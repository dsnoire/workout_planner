import 'package:isar/isar.dart';

import '../../presentation/utils/enums/schedule_enum.dart';

part 'workout.g.dart';

@collection
class Workout {
  Id id = Isar.autoIncrement;
  late String name;
  late int color;
  @enumerated
  late ScheduleEnum schedule;
  late DateTime date;
  late List<String> weekdays;
}
