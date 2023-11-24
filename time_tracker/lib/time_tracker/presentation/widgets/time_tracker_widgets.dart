



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/image_const.dart';
import 'package:time_tracker/core/constants/string_const.dart';
import 'package:time_tracker/core/constants/text_theme.dart';
import 'package:time_tracker/core/constants/theme.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

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
          );
        },
      ),
    );
  }
}

class CustomTimeTrackWidget extends ConsumerWidget {
  final Data data;
  final String title;
  const CustomTimeTrackWidget({
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
                    EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.0.h),
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
                        Text(
                          "${data.timeSpent.current}hrs",
                          style: largeTextRubik(context),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(ImageConst().ellipsisIcon),
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
