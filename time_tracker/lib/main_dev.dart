

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:time_tracker/core/constants/api_const.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/hive_const.dart';
import 'package:time_tracker/core/constants/theme.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_tracker/local_persistence/data/models/time_tracker_adapter.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/presentation/screens/home.dart';
import 'core/constants/environment.dart';
//import 'time_tracker/data/models/time_tracker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.dev,
    values: FlavorValues(baseUrl: ApiConst().devBaseUrl),
  );

  WidgetsFlutterBinding.ensureInitialized();

  // Directory('android/app/src/main/assets').createSync(recursive: true);

  // await File('android/app/src/main/assets/app_config.json')
  //     .writeAsString('{"appId": "com.example.time_tracker_dev"}');
  // await File('ios/Runner/Config/app_config.xcconfig')
  //     .writeAsString('APP_ID=com.example.time_tracker_dev');

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(themeProvider);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Time tracker',
          theme: ThemeData(
            colorScheme: theme.getTheme() == ThemeData.light()
                ? AppTheme.light.toColorScheme()
                : AppTheme.dark.toColorScheme(),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
