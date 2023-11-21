import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:time_tracker/core/exceptions/failure.dart';
import 'package:time_tracker/network_manager/domain/inetwork_manager.dart';
import 'package:time_tracker/time_tracker/data/datasources/itime_tracker.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/data/repository/time_tracker_repository.dart';

class MockTimeTrackerDataSource extends Mock
    implements ITimeTrackerDataSource {}

class MockNetworkManager extends Mock implements INetworkManager {}



void main() {
  late MockTimeTrackerDataSource mockTimeTrackerDataSource;
  late TimeTrackerRepository timeTrackerRepository;
  late MockNetworkManager mockNetworkManager;


  setUp(() {
    mockTimeTrackerDataSource = MockTimeTrackerDataSource();
    mockNetworkManager = MockNetworkManager();
    timeTrackerRepository = TimeTrackerRepository(
      dataSource: mockTimeTrackerDataSource,
      networkManager: mockNetworkManager,
    );
  });

  group('time tracker repository', () {
    test("get time spent when network is connected", () async {
      when(() => mockNetworkManager.isConnected).thenAnswer((_) async => true);

      List<CategoryData> categories = [
        const CategoryData(
          category: "daily",
          data: [
            Data(
              title: "title",
              timeSpent: TimeSpent(current: 5, previous: 7),
            ),
          ],
        ),
      ];

      when(() => mockTimeTrackerDataSource.getTimeSpent())
          .thenAnswer((_) async => TimeSpentList(categories));

      final result = await timeTrackerRepository.getTimeSpent();

      expect(
        result,
        equals(
          Right(
            TimeSpentList(categories),
          ),
        ),
      );
    });


    test(
        "getTimeSpent with dataSource throwing Failure should return Left(Failure)",
        () async {
      when(() => mockNetworkManager.isConnected).thenAnswer((_) async => true);

      final expectedFailure = Failure();
      when(() => mockTimeTrackerDataSource.getTimeSpent())
          .thenThrow(expectedFailure);

      final result = await timeTrackerRepository.getTimeSpent();

      expect(
        result,
        equals(
          Left(expectedFailure),
        ),
      );
    });
  });
}
