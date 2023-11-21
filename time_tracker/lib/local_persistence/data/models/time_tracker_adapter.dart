import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

class TimeSpentAdapter extends TypeAdapter<TimeSpent> {
  @override
  final int typeId = 0;

  @override
  TimeSpent read(BinaryReader reader) {
    final current = reader.read();
    final previous = reader.read();
    return TimeSpent(current: current, previous: previous);
  }

  @override
  void write(BinaryWriter writer, TimeSpent obj) {
    writer.write(obj.current);
    writer.write(obj.previous);
  }
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final title = reader.read();
    final timeSpent = reader.read();
    return Data(title: title, timeSpent: timeSpent);
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer.write(obj.title);
    writer.write(obj.timeSpent);
  }
}

class CategoryDataAdapter extends TypeAdapter<CategoryData> {
  @override
  final int typeId = 2;

  @override
  CategoryData read(BinaryReader reader) {
    final category = reader.read();
    final data = reader.read();
    return CategoryData(category: category, data: data);
  }

  @override
  void write(BinaryWriter writer, CategoryData obj) {
    writer.write(obj.category);
    writer.write(obj.data);
  }
}

class TimeSpentListAdapter extends TypeAdapter<TimeSpentList> {
  @override
  final int typeId = 3;

  @override
  TimeSpentList read(BinaryReader reader) {
    final categories = reader.read();
    return TimeSpentList(categories.cast<CategoryData>());
  }

  @override
  void write(BinaryWriter writer, TimeSpentList obj) {
    writer.write(obj.categories);
  }
}
