import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/theme.dart';
import 'package:time_tracker/time_tracker/logic/providers.dart';
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
      value: SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: currentTheme == ThemeData.light()
            ? Brightness.dark
            : Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: currentTheme == ThemeData.light()
            ? Brightness.light
            : Brightness.dark,
        statusBarColor: colorScheme.veryDarkBlue,
      ),
      child: Scaffold(
        backgroundColor: colorScheme.veryDarkBlue,
        body: timeTracker.when(
          initial: () {
            return const ShimmerWidget();
          },
          loading: () {
            return const ShimmerWidget();
          },
          empty: () {
            return const CustomErrorWidget(
              error: "No Data available",
            );
          },
          networkException: () {
            return const CustomErrorWidget(
              error: "Please check your internet connection and try again",
            );
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
