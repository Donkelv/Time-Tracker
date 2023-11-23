import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:time_tracker/core/constants/string_const.dart';
import 'package:time_tracker/core/exceptions/failure.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

import 'package:time_tracker/time_tracker/domain/use_cases/time_tracker_usecase.dart';
import 'package:time_tracker/time_tracker/logic/notifier.dart';
import 'package:time_tracker/time_tracker/logic/state.dart';

class MockTimeTrackerUseCase extends Mock implements TimeTrackerUseCase {}

void main() {
  late MockTimeTrackerUseCase mockTimeTrackerUseCase;
  late ProviderContainer container;
  late TimeTrackerNotifier notifier;

  setUp(() {
    mockTimeTrackerUseCase = MockTimeTrackerUseCase();
    container = ProviderContainer();
    notifier = TimeTrackerNotifier(
      timeTrackerUseCase: mockTimeTrackerUseCase,
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('time tracker notifier', () {
    test('should update state to TimeTrackerState.initial() on init', () {
      expect(notifier.state, equals(const TimeTrackerState.initial()));
    });


    test(
        'should update state to TimeTrackerState.networkException() when there is a connection exception',
        () async {
      const connectionExcepMessage = StringConst.connectionException;
      when(() => mockTimeTrackerUseCase.call()).thenAnswer(
        (_) async => Left(
          Failure(message: connectionExcepMessage),
        ),
      );

      await notifier.getTimeTracker();

      expect(notifier.state, equals(const TimeTrackerState.networkException()));
    });

    test(
        'should update state to TimeTrackerState.error() when there is a connection exception',
        () async {
      const errorMessage = "Error";
      when(() => mockTimeTrackerUseCase.call()).thenAnswer(
        (_) async => Left(
          Failure(message: errorMessage),
        ),
      );

      await notifier.getTimeTracker();

      expect(
          notifier.state, equals(const TimeTrackerState.error(errorMessage)));
    });

    test(
        'should update state to TimeTrackerState.empty() when the category list is empty',
        () async {
      List<CategoryData> categories = [];
      when(() => mockTimeTrackerUseCase.call()).thenAnswer(
        (_) async => Right(
         categories,
        ),
      );

      await notifier.getTimeTracker();

      expect(notifier.state, equals(const TimeTrackerState.empty()));
    });

    test(
        'should update state to TimeTrackerState.data() when the category list is not empty',
        () async {
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
      when(() => mockTimeTrackerUseCase.call()).thenAnswer(
        (_) async => Right(
          categories,
        ),
      );

      await notifier.getTimeTracker();

      expect(
        notifier.state,
        equals(
          TimeTrackerState.data(
            data: categories,
          ),
        ),
      );
    });
  });
}
