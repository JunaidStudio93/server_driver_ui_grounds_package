import 'package:flutter/material.dart';

import 'package:server_driver_ui_grounds/color_constants.dart';

abstract class AppTheme {
  AppTheme._();

  static final _themeData = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    fontFamily: 'Sora',
    useMaterial3: true,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBlackColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kPrimaryColor,
      error: kRedColor,
      primary: kPrimaryColor,
      background: kBlackColor,
      onBackground: kWhiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: kSecondaryTextColor),
    ),
    iconTheme: const IconThemeData(color: kWhiteColor),
    appBarTheme: AppBarTheme(
      foregroundColor: kWhiteColor,
      centerTitle: false,
      iconTheme: const IconThemeData(color: kWhiteColor),
      backgroundColor: kBlackColor,
      elevation: 0,

      surfaceTintColor: kTransparent,
      shadowColor: kTransparent,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kGreyColor,
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      unselectedIconTheme: IconThemeData(color: kGreyIconColor),
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kGreyIconColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: kPrimaryColor, fontSize: 12),
      unselectedLabelStyle: TextStyle(color: kGreyIconColor, fontSize: 12),
    ),

    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: kContainerColor,
      collapsedBackgroundColor: kContainerColor,
      iconColor: kWhiteColor,
      collapsedIconColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    cardTheme: CardThemeData(
      color: kContainerColor,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: kContainerColor,
      iconColor: kWhiteColor,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        foregroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  static ThemeData darkTheme = _themeData.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kBlackColor,
    bottomNavigationBarTheme: _themeData.bottomNavigationBarTheme,
    appBarTheme: _themeData.appBarTheme,
    textTheme: _themeData.textTheme,
    iconTheme: _themeData.iconTheme,
  );

  static ThemeData lightTheme = _themeData.copyWith(
    brightness: Brightness.light,
    iconTheme: _themeData.iconTheme.copyWith(color: kBlackColor),
    scaffoldBackgroundColor: kWhiteColor,
    bottomNavigationBarTheme: _themeData.bottomNavigationBarTheme.copyWith(
      backgroundColor: kWhiteColor,
    ),
    appBarTheme: _themeData.appBarTheme.copyWith(
      backgroundColor: kWhiteColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: kBlackColor),
      foregroundColor: kBlackColor,
    ),
  );
}
