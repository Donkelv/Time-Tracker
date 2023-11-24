import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracker/local_persistence/domain/ilocal_persistence.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

import '../../../core/constants/hive_const.dart';

class LocalPersistence implements ILocalPersistence {
  final _catDataBox = Hive.box<CategoryData>(HiveConst.categoryDataBox);
  @override
  Future<void> addLocalData({required CategoryData data}) async {
    await _catDataBox.add(data);
  }

  @override
  Future<List<CategoryData>> getLocalData() async {
    return _catDataBox.values.toList();
  }

  @override
  Future<void> storeLocalData({required List<CategoryData> data}) async {
    await _catDataBox.clear();
    await _catDataBox.addAll(data);
  }

  @override
  Future<void> updateLocalData(
      {required CategoryData category,
      required int currentTimeSpent,
      required String title}) async {
    var updatedDataList = category.data.map((data) {
      if (data.title.toLowerCase() == title.toLowerCase()) {
        // Update the specific Data object
        var updatedTimeSpent = TimeSpent(
          current: currentTimeSpent,
          previous: data.timeSpent.current,
        );

        return Data(
          title: data.title,
          timeSpent: updatedTimeSpent,
        );
      } else {
        // Keep other Data objects unchanged
        return data;
      }
    }).toList();

    var updatedCategory = CategoryData(
      category: category.category,
      data: updatedDataList,
    );

    var existingCategories = _catDataBox.values.cast<CategoryData>().toList();

    for (var i = 0; i < existingCategories.length; i++) {
      var existingCategory = existingCategories[i];

      if (kDebugMode) {
        print("Updated Data Length: ${updatedCategory.data.length}");
        print("Existing Data Length: ${existingCategory.data.length}");
        print("Existing Category: ${existingCategory.category}");
        print("Updated Category: ${updatedCategory.category}");
        print(
            "Data Comparison Result: ${existingCategory.data.every((data) => updatedCategory.data.any((updatedData) => updatedData.title.toLowerCase() == data.title.toLowerCase()))}");
      }

      if (existingCategory.category == updatedCategory.category) {
        // Found a match, update at index i
        await _catDataBox.putAt(i, updatedCategory);
        if (kDebugMode) {
          print("Match found at index $i");
        }
        return;
      }
    }
  }
}
