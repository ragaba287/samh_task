import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/const/const.dart';
import '../../../core/res/res_images.dart';
import '../../booking/screens/booking_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return AnimatedSplashScreen.withScreenFunction(
      screenFunction: () async => const BookingScreen(),
      backgroundColor: Colors.white,
      splash: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          SizedBox(
            width: 100.w,
            height: 100.w,
            child: Image.asset(ResImages.logo),
          ),
          const Spacer(),
          Text(
            '$appName @ Copyrights',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
              color: const Color(0xff1f1f99),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
      splashIconSize: 1000,
      disableNavigation: false,
      centered: true,
      duration: 1500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
