import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/const.dart';

ThemeData lightTheme() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: lang == 'ar' ? 'ElMessiri' : 'Poppins',
      brightness: Brightness.light,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff1f1f99),
        onPrimary: Colors.green,
        secondary: Colors.teal,
        onSecondary: Colors.amber,
        error: Colors.red,
        onError: Colors.black,
        background: Colors.yellow,
        onBackground: Colors.green,
        surface: Colors.blue,
        onSurface: Color(0x10188653),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xffefefef),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          fontFamily: lang == 'ar' ? 'ElMessiri' : 'Poppins',
          fontSize: 18.sp,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xffefefef),
        elevation: 5,
        shadowColor: Color(0x800F1015),
      ),
      dividerTheme: DividerThemeData(
        color: const Color(0x30292C31),
        thickness: 1,
        indent: 10.w,
        endIndent: 10.w,
        space: 0,
      ),
      textTheme: TextTheme(
        labelLarge: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xff0F1015),
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xff0F1015),
          fontWeight: FontWeight.w600,
          height: 1.5833333333333333,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xff0F1015),
          fontWeight: FontWeight.w700,
          height: 1.3571428571428572,
          overflow: TextOverflow.ellipsis,
        ),
        titleLarge: TextStyle(
          fontSize: 20.sp,
          color: const Color(0xff0F1015),
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        bodySmall: TextStyle(
          fontSize: 20.sp,
          color: const Color(0xff0F1015),
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xff0F1015),
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      cardTheme: const CardTheme(
        color: Color(0xffefefef),
        surfaceTintColor: Color(0xff0F1015),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Color(0xffefefef)),
    );
