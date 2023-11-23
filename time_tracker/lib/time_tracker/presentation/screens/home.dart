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
        backgroundColor: colorScheme.veryDarkBlue,
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
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
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
      ),
    );
  }
}

class DataWidget extends ConsumerStatefulWidget {
  final AppColorScheme colorScheme;
  const DataWidget({
    required this.colorScheme,
    super.key,
  });

  @override
  ConsumerState<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends ConsumerState<DataWidget>
    with SingleTickerProviderStateMixin {
  final categoryBox = Hive.box<CategoryData>(HiveConst.categoryDataBox);
  late TabController tabBarController;

  @override
  void initState() {
    tabBarController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: false,
      child: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: DefaultTabController(
            length: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  100.0.verticalSpace,
                  Container(
                    height: 230.0.h,
                    decoration: BoxDecoration(
                      color: widget.colorScheme.darkBlue,
                      borderRadius: BorderRadius.circular(15.0.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopCardWidget(
                            size: size, colorScheme: widget.colorScheme),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0.w, vertical: 10.0.h),
                          child: TabBar(
                            controller: tabBarController,
                            indicator: const BoxDecoration(),
                            indicatorColor: Colors.transparent,
                            labelStyle: mediumTextRubik(context)
                                .copyWith(color: Colors.white),
                            unselectedLabelStyle: mediumTextRubik(context)
                                .copyWith(color: widget.colorScheme.paleBlue),
                            tabs: const [
                              Tab(
                                text: "Daily",
                              ),
                              Tab(
                                text: "Weekly",
                              ),
                              Tab(
                                text: "Monthly",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.0.verticalSpace,
                  ValueListenableBuilder(
                    valueListenable: categoryBox.listenable(),
                    builder: ((context, value, child) {
                      return SizedBox(
                        height: size.height,
                        child: TabBarView(
                          controller: tabBarController,
                          children: [
                            TimeTrackerList(
                              data: value.values
                                  .where((element) => element.category == "daily")
                                  .first,
                            ),
                            TimeTrackerList(
                              data: value.values
                                  .where(
                                      (element) => element.category == "weekly")
                                  .first,
                            ),
                            TimeTrackerList(
                              data: value.values
                                  .where(
                                      (element) => element.category == "monthly")
                                  .first,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopCardWidget extends StatelessWidget {
  const TopCardWidget({
    super.key,
    required this.size,
    required this.colorScheme,
  });

  final Size size;
  final AppColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 150.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0.r),
        color: colorScheme.blue,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70.0.w,
              height: 70.0.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                shape: BoxShape.circle,
              ),
            ),
            30.0.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Report for",
                  style: normalTextRubik(context)
                      .copyWith(color: colorScheme.paleBlue),
                ),
                Text(
                  "Jeremy Robson",
                  style: largeTextRubik(context).copyWith(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TimeTrackerList extends StatelessWidget {
  final CategoryData data;
  const TimeTrackerList({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.data.length,
      shrinkWrap: false,
      physics: const NeverScrollableScrollPhysics(),
      //reverse: true,
      itemBuilder: (context, index) {
        return CustomTimeTrackWidget(
          data: data.data[index],
          title: data.category,
        );
      },
    );
  }
}

class CustomTimeTrackWidget extends ConsumerWidget {
  final Data data;
  final String title;
  const CustomTimeTrackWidget( {
    super.key,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider).getTheme();
    final colorScheme =
        currentTheme == ThemeData.light() ? AppTheme.light : AppTheme.dark;
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 20.0.h),
      width: size.width,
      height: 150.0.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0.r),
          color: AppTheme.getColorByName(data.title, isDarkMode: currentTheme == ThemeData.dark()),),
    );
  }
}
