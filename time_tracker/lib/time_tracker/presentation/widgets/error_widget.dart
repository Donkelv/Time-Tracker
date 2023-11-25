import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/image_const.dart';
import 'package:time_tracker/core/constants/text_theme.dart';
import 'package:time_tracker/core/constants/theme.dart';

class CustomErrorWidget extends ConsumerWidget {
  final String error;
  const CustomErrorWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final currentTheme = ref.watch(themeProvider).getTheme();
    final colorScheme =
        currentTheme == ThemeData.light() ? AppTheme.light : AppTheme.dark;
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
              child:  Image.asset( currentTheme == ThemeData.light() ? ImageConst().errorGifDark : ImageConst().errorGifWhite),
            ),
            20.0.verticalSpace,
            Text(
              error,
              textAlign: TextAlign.center,
              style: semiLargeTextRubik(context).copyWith(color: colorScheme.neutral),
            ),
          ],
        ),
      ),
    );
  }
}
