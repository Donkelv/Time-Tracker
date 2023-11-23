import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

class TimeSpentAdapter extends TypeAdapter<TimeSpent> {
  @override
  final int typeId = 0;

  @override
  TimeSpent read(BinaryReader reader) {
    return TimeSpent(
      current: reader.readInt(),
      previous: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, TimeSpent obj) {
    writer.writeInt(obj.current);
    writer.writeInt(obj.previous);
  }
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final title = reader.read() as String;
    final timeSpent = reader.read() as TimeSpent;
    return Data(title: title, timeSpent: timeSpent);
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer.write<String>(obj.title);
    writer.write<TimeSpent>(obj.timeSpent);
  }
}

class CategoryDataAdapter extends TypeAdapter<CategoryData> {
  @override
  final int typeId = 2;

  @override
  CategoryData read(BinaryReader reader) {
    final category = reader.read() as String;
    final List<Data> data = reader.read()?.cast<Data>() ?? [];
    return CategoryData(category: category, data: data);
  }

  @override
  void write(BinaryWriter writer, CategoryData obj) {
    writer.write<String>(obj.category);
    writer.write<List<Data>>(obj.data);
  }
}

class TimeSpentListAdapter extends TypeAdapter<TimeSpentList> {
  @override
  final int typeId = 3;

  @override
  TimeSpentList read(BinaryReader reader) {
    final categories =
        reader.read()?.cast<CategoryData>() ?? [];
    return TimeSpentList(categories);
  }

  @override
  void write(BinaryWriter writer, TimeSpentList obj) {
    writer.write<List<CategoryData>>(obj.categories);
  }
}
