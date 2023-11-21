import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_tracker.freezed.dart';
part 'time_tracker.g.dart';

@freezed
class TimeSpent with _$TimeSpent {
  const factory TimeSpent({
    required int current,
    required int previous,
  }) = _TimeSpent;

  factory TimeSpent.fromJson(Map<String, dynamic> json) =>
      _$TimeSpentFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required String title,
    required TimeSpent timeSpent,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class CategoryData with _$CategoryData {
  const factory CategoryData({
    required String category,
    required List<Data> data,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@freezed
class TimeSpentList with _$TimeSpentList {
  const factory TimeSpentList(List<CategoryData> categories) = _TimeSpentList;

  factory TimeSpentList.fromJson(Map<String, dynamic> json) =>
      _$TimeSpentListFromJson(json);
}
