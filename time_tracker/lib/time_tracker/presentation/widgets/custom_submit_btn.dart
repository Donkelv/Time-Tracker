



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/text_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.textColor, required this.colorScheme,
  }) : super(key: key);

  final Size size;
  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
   final AppColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0.h,
      width: size.width,
      decoration: BoxDecoration(
        color: colorScheme.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Center(
            child: Text(
              text,
              style: mediumTextRubik(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
