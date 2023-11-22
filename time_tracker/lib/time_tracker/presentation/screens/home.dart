import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/image_const.dart';
import 'package:time_tracker/core/constants/text_theme.dart';
import 'package:time_tracker/core/constants/theme.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/logic/providers.dart';

import '../../../core/constants/hive_const.dart';
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
        backgroundColor: colorScheme.darkBlue,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
            return ErrorWidget(
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

class ErrorWidget extends StatelessWidget {
  final String error;
  const ErrorWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150.0.h,
            width: 150.0.w,
            child: Image.asset(ImageConst().errorGifWhite),
          ),
          20.0.verticalSpace,
          Text(
            error,
            textAlign: TextAlign.center,
            style: semiLargeTextRubik(context),
          ),
        ],
      ),
    );
  }
}

class DataWidget extends ConsumerWidget {
  final AppColorScheme colorScheme;
  DataWidget({
    required this.colorScheme,
    super.key,
  });

  final categoryBox = Hive.box<CategoryData>(HiveConst.categoryDataBox);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.0.verticalSpace,
            Container(
              width: size.width,
              height: 50.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: colorScheme.blue,
              ),
            )
            // ValueListenableBuilder(
            //   valueListenable: categoryBox.listenable(),
            //   builder: ((context, value, child) {
            //     return;
            //     // return Column(
            //     //   mainAxisAlignment: Main,
            //     // )
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}
