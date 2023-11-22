import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:time_tracker/core/exceptions/failure.dart';
import 'package:time_tracker/local_persistence/domain/ilocal_persistence.dart';
import 'package:time_tracker/network_manager/domain/inetwork_manager.dart';
import 'package:time_tracker/time_tracker/data/datasources/itime_tracker.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/data/repository/time_tracker_repository.dart';
import 'package:matcher/matcher.dart';

class MockTimeTrackerDataSource extends Mock
    implements ITimeTrackerDataSource {}

class MockNetworkManager extends Mock implements INetworkManager {}

class MockLocalPersistence extends Mock implements ILocalPersistence {}

void main() {
  late MockTimeTrackerDataSource mockTimeTrackerDataSource;
  late TimeTrackerRepository timeTrackerRepository;
  late MockNetworkManager mockNetworkManager;
  late MockLocalPersistence mockLocalPersistence;

  setUp(() {
    mockTimeTrackerDataSource = MockTimeTrackerDataSource();
    mockNetworkManager = MockNetworkManager();
    mockLocalPersistence = MockLocalPersistence();
    timeTrackerRepository = TimeTrackerRepository(
      dataSource: mockTimeTrackerDataSource,
      networkManager: mockNetworkManager,
      localPersistence: mockLocalPersistence,
    );
  });

  group('time tracker repository', () {
    test('should return TimeSpentList from local storage when available',
        () async {
      // Arrange
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

      when(() => mockLocalPersistence.getLocalData())
          .thenAnswer((invocation) async => categories);

      final result = await timeTrackerRepository.getTimeSpent();

      verifyZeroInteractions(mockTimeTrackerDataSource);
      verifyZeroInteractions(mockNetworkManager);
      verify(() => mockLocalPersistence.getLocalData());

      expect(result, equals(Right(TimeSpentList(categories))));
    });

    test('should return TimeSpentList from netowrk and store in local storage',
        () async {
      when(() => mockLocalPersistence.getLocalData())
          .thenAnswer((invocation) async => []);

      when(() => mockNetworkManager.isConnected)
          .thenAnswer((invocation) async => true);

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

      when(() => mockTimeTrackerDataSource.getTimeSpent()).thenAnswer(
        (invocation) async => TimeSpentList(categories),
      );
      try {
        final result = await timeTrackerRepository.getTimeSpent();

        verify(
          () => mockLocalPersistence.storeLocalData(data: categories),
        );

        expect(result, equals(Right(TimeSpentList(categories))));
      } catch (e) {
        if (kDebugMode) {
          print("Exception thrown: $e");
        }
      }
    });

    test('should return ConnectionException when network is not connected',
        () async {
      // Arrange
      when(() => mockLocalPersistence.getLocalData())
          .thenAnswer((_) async => []);
      when(() => mockNetworkManager.isConnected).thenAnswer((_) async => false);

      // Act
      final result = await timeTrackerRepository.getTimeSpent();

      // Assert
      verify(() => mockLocalPersistence.getLocalData())
          .called(1); // Verify the call

      // Clear interactions after the call
      clearInteractions(mockLocalPersistence);

      // Assert
      verifyZeroInteractions(mockTimeTrackerDataSource);
      verifyZeroInteractions(mockLocalPersistence);

      expect(result, isA<Left<Failure, TimeSpentList>>());
    });
  });
}
