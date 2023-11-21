import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_tracker/network_manager/data/network_manager.dart';
import 'package:time_tracker/time_tracker/data/datasources/time_tracker.dart';
import 'package:time_tracker/time_tracker/data/repository/time_tracker_repository.dart';
import 'package:time_tracker/time_tracker/domain/repository/itime_tracker_repository.dart';
import 'package:time_tracker/time_tracker/domain/use_cases/time_tracker_usecase.dart';
import 'package:time_tracker/time_tracker/logic/notifier.dart';
import 'package:time_tracker/time_tracker/logic/state.dart';

final getTimeTrackerProvider =
    StateNotifierProvider<TimeTrackerNotifier, TimeTrackerState>((ref) {
  return TimeTrackerNotifier(
    timeTrackerUseCase: TimeTrackerUseCase(
      repository: ref.watch(timeTrackerBaseProvider),
    ),
  );
});

final timeTrackerBaseProvider = Provider<ITimeTrackerRepository>((ref) {
  return TimeTrackerRepository(
    dataSource: TimeTrackerDataSource(),
    networkManager: NetworkManager(),
  );
});
