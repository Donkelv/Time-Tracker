// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeSpent _$TimeSpentFromJson(Map<String, dynamic> json) {
  return _TimeSpent.fromJson(json);
}

/// @nodoc
mixin _$TimeSpent {
  int get current => throw _privateConstructorUsedError;
  int get previous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSpentCopyWith<TimeSpent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSpentCopyWith<$Res> {
  factory $TimeSpentCopyWith(TimeSpent value, $Res Function(TimeSpent) then) =
      _$TimeSpentCopyWithImpl<$Res, TimeSpent>;
  @useResult
  $Res call({int current, int previous});
}

/// @nodoc
class _$TimeSpentCopyWithImpl<$Res, $Val extends TimeSpent>
    implements $TimeSpentCopyWith<$Res> {
  _$TimeSpentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? previous = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeSpentCopyWith<$Res> implements $TimeSpentCopyWith<$Res> {
  factory _$$_TimeSpentCopyWith(
          _$_TimeSpent value, $Res Function(_$_TimeSpent) then) =
      __$$_TimeSpentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int current, int previous});
}

/// @nodoc
class __$$_TimeSpentCopyWithImpl<$Res>
    extends _$TimeSpentCopyWithImpl<$Res, _$_TimeSpent>
    implements _$$_TimeSpentCopyWith<$Res> {
  __$$_TimeSpentCopyWithImpl(
      _$_TimeSpent _value, $Res Function(_$_TimeSpent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? previous = null,
  }) {
    return _then(_$_TimeSpent(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeSpent implements _TimeSpent {
  const _$_TimeSpent({required this.current, required this.previous});

  factory _$_TimeSpent.fromJson(Map<String, dynamic> json) =>
      _$$_TimeSpentFromJson(json);

  @override
  final int current;
  @override
  final int previous;

  @override
  String toString() {
    return 'TimeSpent(current: $current, previous: $previous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeSpent &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current, previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeSpentCopyWith<_$_TimeSpent> get copyWith =>
      __$$_TimeSpentCopyWithImpl<_$_TimeSpent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeSpentToJson(
      this,
    );
  }
}

abstract class _TimeSpent implements TimeSpent {
  const factory _TimeSpent(
      {required final int current, required final int previous}) = _$_TimeSpent;

  factory _TimeSpent.fromJson(Map<String, dynamic> json) =
      _$_TimeSpent.fromJson;

  @override
  int get current;
  @override
  int get previous;
  @override
  @JsonKey(ignore: true)
  _$$_TimeSpentCopyWith<_$_TimeSpent> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String get title => throw _privateConstructorUsedError;
  TimeSpent get timeSpent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({String title, TimeSpent timeSpent});

  $TimeSpentCopyWith<$Res> get timeSpent;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? timeSpent = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as TimeSpent,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeSpentCopyWith<$Res> get timeSpent {
    return $TimeSpentCopyWith<$Res>(_value.timeSpent, (value) {
      return _then(_value.copyWith(timeSpent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, TimeSpent timeSpent});

  @override
  $TimeSpentCopyWith<$Res> get timeSpent;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? timeSpent = null,
  }) {
    return _then(_$_Data(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      timeSpent: null == timeSpent
          ? _value.timeSpent
          : timeSpent // ignore: cast_nullable_to_non_nullable
              as TimeSpent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data({required this.title, required this.timeSpent});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String title;
  @override
  final TimeSpent timeSpent;

  @override
  String toString() {
    return 'Data(title: $title, timeSpent: $timeSpent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.timeSpent, timeSpent) ||
                other.timeSpent == timeSpent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, timeSpent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {required final String title,
      required final TimeSpent timeSpent}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String get title;
  @override
  TimeSpent get timeSpent;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return _CategoryData.fromJson(json);
}

/// @nodoc
mixin _$CategoryData {
  String get category => throw _privateConstructorUsedError;
  List<Data> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
          CategoryData value, $Res Function(CategoryData) then) =
      _$CategoryDataCopyWithImpl<$Res, CategoryData>;
  @useResult
  $Res call({String category, List<Data> data});
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res, $Val extends CategoryData>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryDataCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$$_CategoryDataCopyWith(
          _$_CategoryData value, $Res Function(_$_CategoryData) then) =
      __$$_CategoryDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, List<Data> data});
}

/// @nodoc
class __$$_CategoryDataCopyWithImpl<$Res>
    extends _$CategoryDataCopyWithImpl<$Res, _$_CategoryData>
    implements _$$_CategoryDataCopyWith<$Res> {
  __$$_CategoryDataCopyWithImpl(
      _$_CategoryData _value, $Res Function(_$_CategoryData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? data = null,
  }) {
    return _then(_$_CategoryData(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryData implements _CategoryData {
  const _$_CategoryData(
      {required this.category, required final List<Data> data})
      : _data = data;

  factory _$_CategoryData.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryDataFromJson(json);

  @override
  final String category;
  final List<Data> _data;
  @override
  List<Data> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CategoryData(category: $category, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryData &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryDataCopyWith<_$_CategoryData> get copyWith =>
      __$$_CategoryDataCopyWithImpl<_$_CategoryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryDataToJson(
      this,
    );
  }
}

abstract class _CategoryData implements CategoryData {
  const factory _CategoryData(
      {required final String category,
      required final List<Data> data}) = _$_CategoryData;

  factory _CategoryData.fromJson(Map<String, dynamic> json) =
      _$_CategoryData.fromJson;

  @override
  String get category;
  @override
  List<Data> get data;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDataCopyWith<_$_CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSpentList _$TimeSpentListFromJson(Map<String, dynamic> json) {
  return _TimeSpentList.fromJson(json);
}

/// @nodoc
mixin _$TimeSpentList {
  List<CategoryData> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSpentListCopyWith<TimeSpentList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSpentListCopyWith<$Res> {
  factory $TimeSpentListCopyWith(
          TimeSpentList value, $Res Function(TimeSpentList) then) =
      _$TimeSpentListCopyWithImpl<$Res, TimeSpentList>;
  @useResult
  $Res call({List<CategoryData> categories});
}

/// @nodoc
class _$TimeSpentListCopyWithImpl<$Res, $Val extends TimeSpentList>
    implements $TimeSpentListCopyWith<$Res> {
  _$TimeSpentListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimeSpentListCopyWith<$Res>
    implements $TimeSpentListCopyWith<$Res> {
  factory _$$_TimeSpentListCopyWith(
          _$_TimeSpentList value, $Res Function(_$_TimeSpentList) then) =
      __$$_TimeSpentListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryData> categories});
}

/// @nodoc
class __$$_TimeSpentListCopyWithImpl<$Res>
    extends _$TimeSpentListCopyWithImpl<$Res, _$_TimeSpentList>
    implements _$$_TimeSpentListCopyWith<$Res> {
  __$$_TimeSpentListCopyWithImpl(
      _$_TimeSpentList _value, $Res Function(_$_TimeSpentList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$_TimeSpentList(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeSpentList implements _TimeSpentList {
  const _$_TimeSpentList(final List<CategoryData> categories)
      : _categories = categories;

  factory _$_TimeSpentList.fromJson(Map<String, dynamic> json) =>
      _$$_TimeSpentListFromJson(json);

  final List<CategoryData> _categories;
  @override
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'TimeSpentList(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeSpentList &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimeSpentListCopyWith<_$_TimeSpentList> get copyWith =>
      __$$_TimeSpentListCopyWithImpl<_$_TimeSpentList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeSpentListToJson(
      this,
    );
  }
}

abstract class _TimeSpentList implements TimeSpentList {
  const factory _TimeSpentList(final List<CategoryData> categories) =
      _$_TimeSpentList;

  factory _TimeSpentList.fromJson(Map<String, dynamic> json) =
      _$_TimeSpentList.fromJson;

  @override
  List<CategoryData> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_TimeSpentListCopyWith<_$_TimeSpentList> get copyWith =>
      throw _privateConstructorUsedError;
}
