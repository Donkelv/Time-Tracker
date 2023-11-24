import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';
import 'package:time_tracker/core/constants/text_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.controller,
      this.obscureText,
      this.textInputType,
      this.onEditingComplete,
      this.onFocusChange,
      this.onChanged,
      this.maxLines,
      this.prefixIcon,
      this.maxLength,
      this.suffixIcon,
      this.inputFormatters,
      this.readOnly,
      this.filled,
      this.filledColor, required this.colorScheme})
      : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final void Function()? onEditingComplete;
  final void Function(bool)? onFocusChange;
  final void Function(String)? onChanged;
  final int? maxLines;
  final String? prefixIcon;
  final int? maxLength;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final bool? filled;
  final Color? filledColor;
  final AppColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: onFocusChange,
      child: TextFormField(
        readOnly: readOnly ?? false,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        keyboardType: textInputType ?? TextInputType.name,
        obscureText: obscureText ?? false,
        obscuringCharacter: "•",
        controller: controller,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style: mediumTextRubik(context).copyWith(color: colorScheme.primary),
        decoration: InputDecoration(
          filled: filled,
          fillColor: filledColor,
          counter: const Offstage(),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null
              ? SvgPicture.asset(
                  prefixIcon!,
                  fit: BoxFit.scaleDown,
                )
              : null,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 14.0.w),
          hintText: hintText,
          hintStyle: mediumTextRubik(context).copyWith(color: colorScheme.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: colorScheme.blue, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: colorScheme.blue, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: colorScheme.blue, width: 0.5),
          ),
        ),
      ),
    );
  }
}
