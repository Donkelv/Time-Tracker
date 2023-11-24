import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';

import 'package:time_tracker/core/constants/string_extension.dart';
import 'package:time_tracker/core/constants/text_theme.dart';
import 'package:time_tracker/core/constants/theme.dart';
import 'package:time_tracker/core/constants/toast.dart';
import 'package:time_tracker/local_persistence/data/repository/local_persistence.dart';
import 'package:time_tracker/local_persistence/domain/ilocal_persistence.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/custom_submit_btn.dart';
import 'package:time_tracker/time_tracker/presentation/widgets/custom_text_field.dart';

class AddTimeSpent extends ConsumerStatefulWidget {
  final Data data;
  final String title;
  final CategoryData categoryData;
  const AddTimeSpent(
      {super.key,
      required this.data,
      required this.title,
      required this.categoryData});

  @override
  ConsumerState<AddTimeSpent> createState() => _AddTimeSpentState();
}

class _AddTimeSpentState extends ConsumerState<AddTimeSpent> {
  String? selectedCategory;
  String? selectedTitle;

  final ILocalPersistence _localPersistence = LocalPersistence();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final currentTheme = ref.watch(themeProvider).getTheme();

    final colorScheme =
        currentTheme == ThemeData.light() ? AppTheme.light : AppTheme.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.0.verticalSpace,
          Text(
            " Enter ${StringExtensions(widget.title).capitalize()} time spent on\n ${StringExtensions(widget.data.title).capitalize()}",
            style: semiLargeTextRubik(context)
                .copyWith(color: colorScheme.neutral),
          ),
          20.0.verticalSpace,
          CustomTextField(
            controller: controller,
            colorScheme: colorScheme,
            hintText: "Enter time spent (0)",
            textInputType: TextInputType.number,
          ),
          20.0.verticalSpace,
          CustomButton(
            size: size,
            onTap: () {
              if (controller.text.isEmpty) {
                showToast("Enter time spent to continue", colorScheme);
              } else {
                _localPersistence.updateLocalData(
                  category: widget.categoryData,
                  title: widget.data.title,
                  currentTimeSpent: int.tryParse(controller.text)!,
                );
                Navigator.pop(context);
              }
            },
            text: "Submit",
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }
}
