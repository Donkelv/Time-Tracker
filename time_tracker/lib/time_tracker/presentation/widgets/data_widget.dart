

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/hive_const.dart';
import 'package:time_tracker/core/constants/text_theme.dart';
import 'package:time_tracker/core/constants/theme.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/time_tracker_widgets.dart';

import 'top_card_widget.dart';

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
    final currentTheme = ref.watch(themeProvider).getTheme();
    final colorScheme =
        currentTheme == ThemeData.light() ? AppTheme.light : AppTheme.dark;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      bottom: false,
      child: DefaultTabController(
        length: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                20.0.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        ref.watch(themeProvider.notifier).toggleTheme();
                      },
                      icon: currentTheme == ThemeData.light()
                          ? Icon(
                              Icons.dark_mode_outlined,
                              color: colorScheme.blue,
                            )
                          : Icon(
                              Icons.light_mode_outlined,
                              color: colorScheme.paleBlue,
                            ),
                    ),
                  ],
                ),
                20.0.verticalSpace,
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
                          padding: EdgeInsets.zero,
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
                    return Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
