import 'package:dartz/dartz.dart';
import 'package:time_tracker/core/exceptions/failure.dart';
import 'package:time_tracker/local_persistence/domain/ilocal_persistence.dart';
import 'package:time_tracker/network_manager/domain/inetwork_manager.dart';
import 'package:time_tracker/time_tracker/data/datasources/itime_tracker.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/domain/repository/itime_tracker_repository.dart';

class TimeTrackerRepository implements ITimeTrackerRepository {
  TimeTrackerRepository(
      {required ITimeTrackerDataSource dataSource,
      required INetworkManager networkManager,
      required ILocalPersistence localPersistence})
      : _dataSource = dataSource,
        _networkManager = networkManager,
        _localPersistence = localPersistence;
  final INetworkManager _networkManager;
  final ITimeTrackerDataSource _dataSource;
  final ILocalPersistence _localPersistence;

  @override
  Future<Either<Failure, TimeSpentList>> getTimeSpent() async {
    if (await _localPersistence.getLocalData().then((value) => value.isEmpty)) {
      if (await _networkManager.isConnected) {
        try {
          final TimeSpentList timeSpentList = await _dataSource.getTimeSpent();
          await _localPersistence.storeLocalData(
              data: timeSpentList.categories);
          return Right(timeSpentList);
        } on Failure catch (e) {
          return Left(e);
        } catch (_) {
          return Left(InternalException());
        }
      } else {
        return Left(ConnectionException());
      }
    } else {
      final List<CategoryData> categoryList =
          await _localPersistence.getLocalData();
      final TimeSpentList timeSpentList = TimeSpentList(categoryList);
      return Right(timeSpentList);
    }
  }
}
