import 'package:dartz/dartz.dart';
import 'package:time_tracker/core/exceptions/failure.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/domain/repository/itime_tracker_repository.dart';

class TimeTrackerUseCase {
  TimeTrackerUseCase({required ITimeTrackerRepository repository})
      : _repository = repository;

  final ITimeTrackerRepository _repository;

  Future<Either<Failure, List<CategoryData>>> call() {
    return _repository.getTimeSpent();
  }
}
