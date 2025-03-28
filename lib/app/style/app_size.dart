import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppSize {
  static double get bottomNavigationBarBorderRadius => 0.r;

  // Screen
  static const horizontalMode = Size(852, 393);
  static const verticalMode = Size(393, 852);
  static const tabletVerticalSize = Size(700, 1232);

  // Radius
  static double get radius1 => 5.r;
  static double get radius2 => 10.r;
  static double get radius3 => 50.r;

  // Button
  static double get loginButtonWidth => 400.w;
  static double get loginButtonHeight => 50.w;
  static double get buttonRadius => 5.r;
  static double get buttonHeight => 50.w;
  static double get buttonWidth => 284.w;

  // TextField
  static double get textFieldWidth => 400.w;
  static double get textFieldHeight => 48.h;
  static double get textFieldHeight1 => 10.w;
  static double get textFieldHeight2 => 12.w;
  static double get textFieldHeight3 => 14.w;

  // Spacing
  static double get heightXS => 8.w;
  static double get heightS => 24.w;
  static double get heightM => 30.w;
  static double get heightL => 36.w;
  static double get heightXL => 42.w;
  static double get radius => 5.r;

  // Width
  static double get widthXS => 8.w;
  static double get widthS => 16.w;
  static double get widthM => 24.w;
  static double get widthL => 30.w;
  static double get widthXL => 36.w;

  // Container
  static double get loginBoxWidth => 460.w;
  static double get loginBoxHeight => 550.w;
  static double get signupBoxWidth => 460.w;
  static double get signupBoxHeight => 610.w;

  // Image
  static double get logoHeight => 100.r;
  static double get logoWidth => 190.r;
  static double get therapyStartIconWidth => 160.r;
  static double get therapyStartIconHeight => 152.r;
  static double get therapyHistoryIconWidth => 136.31.r;
  static double get therapyHistoryIconHeight => 130.r;
  static double get iconSize => 40.r;
  static double get mainAppSize => 40.r;
  static double get iconBoxSize => 60.r;

  // Font
  static double get fontSizeS => 12.sp;
  static double get fontSizeM => 14.sp;
  static double get fontSizeL => 16.sp;
  static double get fontSizeXL => 18.sp;
  static double get fontSizeXXL => 26.sp;
  static double get fontSizeXXXL => 38.sp;

  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top; // 상태바 높이
  }
}
