import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_tracker/core/constants/string_const.dart';
import 'package:time_tracker/time_tracker/domain/use_cases/time_tracker_usecase.dart';
import 'package:time_tracker/time_tracker/logic/state.dart';

class TimeTrackerNotifier extends StateNotifier<TimeTrackerState> {
  TimeTrackerNotifier({
    required TimeTrackerUseCase timeTrackerUseCase,
    
  })  : 
        _timeTrackerUseCase = timeTrackerUseCase,
        super(const TimeTrackerState.initial());

  final TimeTrackerUseCase _timeTrackerUseCase;

  Future<void> getTimeTracker() async {
    state = const TimeTrackerState.loading();
    final result = await _timeTrackerUseCase.call();
    result.fold((l) {
      if (l.message == StringConst.connectionException) {
        state = const TimeTrackerState.networkException();
      } else {
        state = TimeTrackerState.error(l.message);
      }
    }, (r) async {
      if (r.categories.isEmpty) {
        state = const TimeTrackerState.empty();
      } else {
        state = TimeTrackerState.data(data: r);
      }
    });
  }
}
