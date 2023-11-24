
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:time_tracker/core/constants/color_scheme.dart';


void showToast(String message, AppColorScheme colorScheme) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorScheme.neutral,
      textColor: colorScheme.paleBlue,
      fontSize: 14.0.sp);
}
