import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/text_theme.dart';

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
