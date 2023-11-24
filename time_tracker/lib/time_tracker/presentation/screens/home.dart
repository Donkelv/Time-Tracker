import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/theme.dart';
import 'package:time_tracker/time_tracker/logic/providers.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/add_time_spent_sheet.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/customer_stacked_sheet.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/data_widget.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/error_widget.dart';
import '../widgets/shimmer_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(getTimeTrackerProvider.notifier).getTimeTracker();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider).getTheme();
    final timeTracker = ref.watch(getTimeTrackerProvider);
    final colorScheme =
        currentTheme == ThemeData.light() ? AppTheme.light : AppTheme.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
        //statusBarColor: ColorConsts.white,
      ),
      child: Scaffold(
        backgroundColor: colorScheme.veryDarkBlue,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            customShowStackedBottomSheet(
              child: const AddTimeSpent(),
              context: context,
              colorScheme: colorScheme,
              backColor: colorScheme.veryDarkBlue,
            );
          },
          backgroundColor: colorScheme.blue,
          child: Icon(
            Icons.add,
            color: currentTheme.primaryIconTheme.color,
          ),
        ),
        body: timeTracker.when(
          initial: () {
            return const ShimmerWidget();
          },
          loading: () {
            return const ShimmerWidget();
          },
          empty: () {
            return Container();
          },
          networkException: () {
            return Container();
          },
          error: (error) {
            return CustomErrorWidget(
              error: error,
            );
          },
          data: (data) {
            return DataWidget(
              colorScheme: colorScheme,
            );
          },
        ),
      ),
    );
  }
}
