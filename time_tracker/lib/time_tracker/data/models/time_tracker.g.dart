// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimeSpent _$$_TimeSpentFromJson(Map<String, dynamic> json) => _$_TimeSpent(
      current: json['current'] as int,
      previous: json['previous'] as int,
    );

Map<String, dynamic> _$$_TimeSpentToJson(_$_TimeSpent instance) =>
    <String, dynamic>{
      'current': instance.current,
      'previous': instance.previous,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      title: json['title'] as String,
      timeSpent: TimeSpent.fromJson(json['timeSpent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'title': instance.title,
      'timeSpent': instance.timeSpent,
    };

_$_CategoryData _$$_CategoryDataFromJson(Map<String, dynamic> json) =>
    _$_CategoryData(
      category: json['category'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CategoryDataToJson(_$_CategoryData instance) =>
    <String, dynamic>{
      'category': instance.category,
      'data': instance.data,
    };

_$_TimeSpentList _$$_TimeSpentListFromJson(Map<String, dynamic> json) =>
    _$_TimeSpentList(
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TimeSpentListToJson(_$_TimeSpentList instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
