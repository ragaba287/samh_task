import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/const.dart';

ThemeData darkTheme() => ThemeData(
      scaffoldBackgroundColor: const Color(0xff0F1015),
      fontFamily: lang == 'ar' ? 'ElMessiri' : 'Poppins',
      brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
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
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff0F1015)),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xff1f1f99),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(color: Color(0xff7E8387)),
        titleTextStyle: TextStyle(
          fontFamily: lang == 'ar' ? 'ElMessiri' : 'Poppins',
          fontSize: 18.sp,
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xff202224),
        elevation: 12,
        shadowColor: Color(0x800F1015),
      ),
      dividerTheme: DividerThemeData(
        color: const Color(0xff292C31),
        thickness: 1,
        indent: 10.w,
        endIndent: 10.w,
        space: 0,
      ),
      textTheme: TextTheme(
        labelLarge: TextStyle(
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          fontSize: 12.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.5833333333333333,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          height: 1.3571428571428572,
          overflow: TextOverflow.ellipsis,
        ),
        titleLarge: TextStyle(
          fontSize: 20.sp,
          color: Colors.white,
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
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
      cardTheme: const CardTheme(
        color: Color(0xff202224),
        surfaceTintColor: Colors.white,
      ),
    );
