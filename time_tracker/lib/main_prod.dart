import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:time_tracker/core/constants/api_const.dart';
import 'package:time_tracker/core/constants/environment.dart';
import 'package:time_tracker/core/constants/hive_const.dart';
import 'package:time_tracker/core/constants/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_tracker/local_persistence/data/models/time_tracker_adapter.dart';
import 'main_dev.dart';
import 'time_tracker/data/models/time_tracker.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.production,
    values: FlavorValues(baseUrl: ApiConst().prodBaseUrl),
  );
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(TimeSpentAdapter());
  Hive.registerAdapter(CategoryDataAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(TimeSpentListAdapter());

  await Hive.openBox<CategoryData>(HiveConst.categoryDataBox);
  await Hive.openBox<Data>(HiveConst.dataBox);
  await Hive.openBox<TimeSpent>(HiveConst.timeSpentBox);
  await Hive.openBox<TimeSpentList>(HiveConst.timeSpentListBox);

  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWith((ref) => ThemeProvider(ref)),
      ],
      child: const MyApp(),
    ),
  );
}
