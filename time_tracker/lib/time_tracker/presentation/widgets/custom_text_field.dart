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
          hintStyle: mediumTextRubik(context).copyWith(color: colorScheme.neutral),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: colorScheme.neutral, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: colorScheme.neutral, width:1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide:
                BorderSide(color: colorScheme.neutral, width: 1),
          ),
        ),
      ),
    );
  }
}


class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget(
      {Key? key,
      this.width,
      required this.list,
      required this.selectedValue,
      required this.onChanged,
      this.child,
      this.hintText, required this.colorScheme})
      : super(key: key);

  final double? width;
  final List<String> list;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final Widget? child;
  final String? hintText;
  final AppColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: colorScheme.neutral, width: 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            isExpanded: true,
            hint: Text(
              hintText ?? "Please Select",
              style:
                  mediumTextRubik(context).copyWith(color: colorScheme.neutral),
            ),
            icon: Icon(Icons.arrow_drop_down_circle_outlined, color: colorScheme.neutral,),
            items: list
                .map(
                  (String value) => DropdownMenuItem(
                    value: value,
                    child: child ??
                        Text(
                          value,
                          style: normalTextRubik(context).copyWith(color: colorScheme.neutral),
                        ),
                  ),
                )
                .toList(),
            value: selectedValue,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
