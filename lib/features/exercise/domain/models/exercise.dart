import 'package:isar/isar.dart';

part 'exercise.g.dart';

@collection
class Exercise {
  Id id = Isar.autoIncrement;
  late String name;
  late int sets;
  late int reps;
  late int rir;
  DateTime? restTime;
}
