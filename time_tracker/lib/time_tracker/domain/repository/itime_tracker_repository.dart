import 'package:dartz/dartz.dart';
import 'package:time_tracker/core/exceptions/failure.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

abstract class ITimeTrackerRepository {
  Future<Either<Failure, TimeSpentList>> getTimeSpent();
}
