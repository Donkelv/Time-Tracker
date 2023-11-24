



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';

void customShowStackedBottomSheet(
    {required Widget child,
    required BuildContext context,
    required AppColorScheme colorScheme,
    bool? isDismissible,
    Size? size,
    Color? backColor,
    BoxConstraints? constraints }) {
  showModalBottomSheet(
    isDismissible: isDismissible ?? true,
    isScrollControlled: true,
    constraints: constraints,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24.0),
      ),
    ),
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0.w),
              //width: size!.width,
              height: 10.0.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80.0.r),
                    topRight: Radius.circular(80.0.r),
                  ),
                  color: colorScheme.blackColor10),
            ),
            Container(
              //height: 700.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0.r),
                  topRight: Radius.circular(15.0.r),
                ),
                color: backColor
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0.h,
                    ),
                    
                    child,
                  ],
                ),
              ),
            ),
            Container(
              color: backColor,
              height: 32.0.h,
            ),
          ],
        ),
      ),
    ),
  );
}
