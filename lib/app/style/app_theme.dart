import 'package:flutter/material.dart';
import 'package:mvp_provider_boilerplate/app/style/app_color.dart';

class AppTheme {
  /// LIGHT
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.grey,
    ),
    primaryColor: AppColor.green,
    primarySwatch: Colors.blue,
    splashFactory: NoSplash.splashFactory,
    textTheme: ThemeData().textTheme.apply(
          fontFamily: 'pretendard',
          bodyColor: AppColor.black,
          displayColor: AppColor.black,
        ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xFFC7CCF8),
      cursorColor: AppColor.primary500,
      selectionHandleColor: AppColor.primary500,
    ),
  );

  /// DARK
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: ThemeData().textTheme.apply(
          fontFamily: 'pretendard',
          bodyColor: AppColor.black,
          displayColor: AppColor.black,
        ),
  );
}
