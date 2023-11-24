import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/image_const.dart';
import 'package:time_tracker/core/constants/string_const.dart';
import 'package:time_tracker/core/constants/text_theme.dart';
import 'package:time_tracker/core/constants/theme.dart';
import 'package:time_tracker/core/constants/time_spent_utils.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/add_time_spent_sheet.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/customer_stacked_sheet.dart';

class TimeTrackerList extends StatelessWidget {
  final CategoryData data;
  const TimeTrackerList({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      radius: Radius.circular(20.0.r),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 100.0.h),
        itemCount: data.data.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        //reverse: true,
        itemBuilder: (context, index) {
          return CustomTimeTrackWidget(
            data: data.data[index],
            title: data.category,
            categoryData: data,
          );
        },
      ),
    );
  }
}

class CustomTimeTrackWidget extends ConsumerWidget {
  final Data data;
  final String title;
  final CategoryData categoryData;
  const CustomTimeTrackWidget({
    super.key,
    required this.data,
    required this.title,
    required this.categoryData,
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
        color: AppTheme.getColorByName(data.title,
            isDarkMode: currentTheme == ThemeData.dark()),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -5.0.h,
            right: 20.0.w,
            child: SvgPicture.asset(
              ImageConst().getTimeFrameIcon(data.title),
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: size.width,
              height: 100.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0.r),
                color: colorScheme.darkBlue,
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 15.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: normalTextRubik(context),
                        ),
                        10.0.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${data.timeSpent.current}hrs",
                              style: largeTextRubik(context),
                            ),
                            20.0.horizontalSpace,
                            Text(
                              TimeSpentUtils.calculateGrowthOrDrop(data.timeSpent.current, data.timeSpent.previous),
                              style: normalTextRubik(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          child: Container(
                            height: 20.0.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0.r),
                              onTap: () {
                                customShowStackedBottomSheet(
                                  child:  AddTimeSpent(
                                    data: data,
                                    title: title,
                                    categoryData: categoryData,
                                  ),
                                  context: context,
                                  colorScheme: colorScheme,
                                  backColor: colorScheme.veryDarkBlue,
                                );
                              },
                              child: SvgPicture.asset(ImageConst().ellipsisIcon),
                            ),
                          ),
                        ),
                        20.0.verticalSpace,
                        Text(
                          "${StringConst.getTimeFrame(title)} - ${data.timeSpent.previous}hrs",
                          style: normalTextRubik(context)
                              .copyWith(color: colorScheme.paleBlue),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
