import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle largestTextRubik(BuildContext context) {
  return GoogleFonts.rubik(
    fontSize: 32.0.sp,
    color: Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).textTheme.bodyLarge?.color
        : Colors.white, 
    fontWeight: FontWeight.w700,
  );
}

TextStyle largeTextRubik(BuildContext context) {
  return GoogleFonts.rubik(
    fontSize: 25.0.sp,
     color: Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).textTheme.bodyLarge?.color
        : Colors.white, 
    //fontWeight: FontWeight.w700,
  );
}

TextStyle semiLargeTextRubik(BuildContext context) {
  return GoogleFonts.rubik(
    fontSize: 20.0.sp,
     color: Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).textTheme.bodyLarge?.color
        : Colors.white, 
    //fontWeight: FontWeight.w600,
  );
}

TextStyle mediumTextRubik(BuildContext context) {
  return GoogleFonts.rubik(
    fontSize: 18.0.sp,
    color: Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).textTheme.bodyLarge?.color
        : Colors.white, 
    //fontWeight: FontWeight.w500,
  );
}

TextStyle normalTextRubik(BuildContext context) {
  return GoogleFonts.rubik(
    fontSize: 14.0.sp,
    color: Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).textTheme.bodyLarge?.color
        : Colors.white, 
    //fontWeight: FontWeight.w400,
  );
}

TextStyle smallTextRubik(BuildContext context) {
  return GoogleFonts.rubik(
    fontSize: 12.0.sp,
     color: Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).textTheme.bodyLarge?.color
        : Colors.white, 
    fontWeight: FontWeight.w300,
  );
}

TextStyle smallestTextRubik(BuildContext context) {
  return GoogleFonts.rubik(
    fontSize: 10.0.sp,
     color: Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).textTheme.bodyLarge?.color
        : Colors.white, 
    fontWeight: FontWeight.w200,
  );
}
