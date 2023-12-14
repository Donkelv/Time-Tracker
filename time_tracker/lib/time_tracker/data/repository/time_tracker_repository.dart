import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
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
  Future<Either<Failure, List<CategoryData>>> getTimeSpent() async {
    final bool isEmpty =
        await _localPersistence.getLocalData().then((value) => value.isEmpty);
    if (isEmpty) {
      if (await _networkManager.isConnected) {
        try {
          final List<CategoryData> categories =
              await _dataSource.getTimeSpent();
          await _localPersistence.storeLocalData(data: categories);
          return Right(categories);
        } on Failure catch (e) {
          return Left(e);
        } catch (e) {
          debugPrint(e.toString());
          return Left(InternalException());
        }
      } else {
        return Left(ConnectionException());
      }
    } else {
      final List<CategoryData> categoryList =
          await _localPersistence.getLocalData();
      return Right(categoryList);
    }
  }
}
