import 'package:dartz/dartz.dart';
import 'package:time_tracker/core/exceptions/failure.dart';
import 'package:time_tracker/network_manager/domain/inetwork_manager.dart';
import 'package:time_tracker/time_tracker/data/datasources/itime_tracker.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/domain/repository/itime_tracker_repository.dart';

class TimeTrackerRepository implements ITimeTrackerRepository {
  TimeTrackerRepository(
      {required ITimeTrackerDataSource dataSource,
      required INetworkManager networkManager})
      : _dataSource = dataSource,
        _networkManager = networkManager;
  final INetworkManager _networkManager;
  final ITimeTrackerDataSource _dataSource;

  @override
  Future<Either<Failure, TimeSpentList>> getTimeSpent() async {
    if (await _networkManager.isConnected) {
      try {
        final TimeSpentList timeSpentList = await _dataSource.getTimeSpent();
        return Right(timeSpentList);
      } on Failure catch (e) {
        return Left(e);
      } catch (_) {
        return Left(InternalException());
      }
    } else {
      return Left(ConnectionException());
    }
  }
}
