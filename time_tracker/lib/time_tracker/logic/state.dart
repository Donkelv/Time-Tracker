import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
part 'state.freezed.dart';

@freezed
class TimeTrackerState with _$TimeTrackerState {
  const factory TimeTrackerState.initial() = _Initial;
  const factory TimeTrackerState.loading() = _Loading;
  const factory TimeTrackerState.empty() = _Empty;
  const factory TimeTrackerState.networkException() = _NetworkException;
  const factory TimeTrackerState.error(String error) = _Error;
  const factory TimeTrackerState.data({required List<CategoryData> data}) = _Data;
}
