import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavlok/config/colors.dart';
import 'package:pavlok/config/store_keys.dart';

class MyTheme {
  final _textTheme = GoogleFonts.manropeTextTheme();

  static final _light = ThemeData(
    textTheme: GoogleFonts.manropeTextTheme(),
    platform: TargetPlatform.iOS,
    primaryColor: PavlokColors.primary,
    scaffoldBackgroundColor: PavlokColors.bgColor,
    tabBarTheme: TabBarTheme(
      labelColor: PavlokColors.primary,
      unselectedLabelColor: PavlokColors.greyText,
      labelStyle: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: PavlokColors.primary,
      ),
      unselectedLabelStyle: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: PavlokColors.secondaryText,
      ),
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: PavlokColors.primary,
            width: 2,
          ),
        ),
      ),
    ),
    useMaterial3: true,
  );
  static final _dark = ThemeData(
    textTheme: GoogleFonts.manropeTextTheme(),
    platform: TargetPlatform.iOS,
    primaryColor: PavlokColors.primary,
    tabBarTheme: TabBarTheme(
      labelColor: PavlokColors.primary,
      unselectedLabelColor: PavlokColors.greyText,
      labelStyle: GoogleFonts.manropeTextTheme().bodyText1,
      unselectedLabelStyle: GoogleFonts.manropeTextTheme().bodyText1,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: PavlokColors.primary,
            width: 2,
          ),
        ),
      ),
    ),
  );

  static ThemeData get light => _light;

  static ThemeData get dark => _dark;

  static ThemeMode get themeMode {
    final _ = GetStorage();

    final _mode = _.read<String>(StoreKeys.themeMode);

    switch (_mode) {
      case 'l':
        return ThemeMode.light;
      case 'd':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
