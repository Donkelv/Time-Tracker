// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:time_tracker/core/constants/hive_const.dart';
// import 'package:time_tracker/local_persistence/data/models/time_tracker_adapter.dart';
// import 'package:time_tracker/local_persistence/data/repository/local_persistence.dart';
// import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';


// import 'package:mockito/mockito.dart';

// class MockMethodChannel extends Mock implements MethodChannel {}

// void main() {


//   TestWidgetsFlutterBinding.ensureInitialized();

//   late MockMethodChannel mockMethodChannel;

//   setUp(() {
//     mockMethodChannel = MockMethodChannel();
//     // Mock the behavior of method calls on the channel
//     when(mockMethodChannel.invokeMethod<String>(
//       'getTemporaryDirectory',
//     )).thenAnswer((_) async => '/mock/temp');

//     // Replace the default implementation with the mock
//     PathProviderPlatform.instance = MethodChannelPathProviderPlatform(
//       methodChannel: mockMethodChannel,
//     );
//   });

//   tearDown(() {
//     // Reset the instance to avoid any conflicts between tests
//     PathProviderPlatform.instance = MethodChannelPathProviderPlatform();
//   });

//   group('LocalPersistence', () {
//     late LocalPersistence localPersistence;

//     setUpAll(() async {
//       TestWidgetsFlutterBinding.ensureInitialized();
//       final appDocumentDir = await getTemporaryDirectory();
//       Hive.init(appDocumentDir.path);
//       Hive.registerAdapter(TimeSpentAdapter());
//       Hive.registerAdapter(CategoryDataAdapter());
//       Hive.registerAdapter(DataAdapter());
//       Hive.registerAdapter(TimeSpentListAdapter());
//     });

//     setUp(() {
//       // Open the Hive boxes before each test
//       Hive.openBox<CategoryData>(HiveConst.categoryDataBox);
//       Hive.openBox<Data>(HiveConst.dataBox);
//       Hive.openBox<TimeSpent>(HiveConst.timeSpentBox);
//       Hive.openBox<TimeSpentList>(HiveConst.timeSpentListBox);

//       // Initialize your LocalPersistence instance before each test
//       localPersistence = LocalPersistence();
//     });

//     test('addLocalData adds data to the box', () async {
//       final testData = CategoryData(category: 'Test', data: []);

//       await localPersistence.addLocalData(data: testData);

//       final storedData = await localPersistence.getLocalData();
//       expect(storedData, contains(testData));
//     });

//     test('storeLocalData stores a list of data in the box', () async {
//       final testDataList = [
//         CategoryData(category: 'Test1', data: []),
//         CategoryData(category: 'Test2', data: []),
//       ];

//       await localPersistence.storeLocalData(data: testDataList);

//       final storedData = await localPersistence.getLocalData();
//       expect(storedData, containsAllInOrder(testDataList));
//     });

//     test('updateLocalData updates data in the box', () async {
//       // Assume some initial data is already stored
//       final initialData = CategoryData(category: 'Test', data: [
//         Data(title: 'Title1', timeSpent: TimeSpent(current: 10, previous: 5)),
//         Data(title: 'Title2', timeSpent: TimeSpent(current: 20, previous: 15)),
//       ]);

//       await localPersistence.storeLocalData(data: [initialData]);

//       // Data to update with
//       final updatedData = Data(
//           title: 'Title1', timeSpent: TimeSpent(current: 15, previous: 10));

//       await localPersistence.updateLocalData(
//         category: initialData,
//         currentTimeSpent: updatedData.timeSpent.current,
//         title: updatedData.title,
//       );

//       final storedData = await localPersistence.getLocalData();

//       // Check if the data is updated as expected
//       expect(storedData.first.data, contains(updatedData));
//     });
//   });
// }
