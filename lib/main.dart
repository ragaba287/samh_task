import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'config/theme/dark_theme.dart';
import 'config/theme/light_theme.dart';
import 'core/const/const.dart';
import 'core/utils/app_local.dart';
import 'core/utils/router.dart';
import 'core/utils/sharedpreference.dart';
import 'cubit/home/home_cubit.dart';
import 'cubit/home/home_states.dart';
import 'features/splash/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Sharedpreference.init();
  lang = await Sharedpreference.getData(key: 'lang') ?? 'ar';

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

  static void setLocale(BuildContext context, String newLang) {
    _MainAppState? state = context.findAncestorStateOfType<_MainAppState>();
    state?.setLocale(newLang);
  }
}

class _MainAppState extends State<MainApp> {
  setLocale(String locale) => setState(() => lang = locale);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) => HomeCubit()),
          ],
          child: BlocConsumer<HomeCubit, HomeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  onGenerateRoute: onGenerateRoute,
                  navigatorKey: navigatorKey,
                  darkTheme: darkTheme(),
                  theme: lightTheme(),
                  debugShowCheckedModeBanner: false,
                  themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    MonthYearPickerLocalizations.delegate,
                  ],
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null &&
                          deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  locale: Locale(lang),
                  supportedLocales: const [Locale('ar'), Locale('en')],
                  home: const SplashScreen(),
                );
              }),
        );
      },
    );
  }
}
