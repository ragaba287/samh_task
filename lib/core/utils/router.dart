// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoute(RouteSettings settings) => null;

class RouterNavigator {
  static BuildContext? currentContext = navigatorKey.currentContext;

  static Route<dynamic> _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);

  static Future<dynamic> navigateTo(Widget page) =>
      navigatorKey.currentState!.push(_materialPageRoute(page));

  static Future<dynamic> navigateAndPop(Widget page) {
    RouterNavigator.pop();
    return navigatorKey.currentState!.push(_materialPageRoute(page));
  }

  // static Future<dynamic> navigateToSlideLeft(Widget page) =>
  //     navigatorKey.currentState!.push(SlideLeftPageRoute(page));

  static Future<dynamic> navigateAndPopAll(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _materialPageRoute(page),
        (_) => false,
      );

  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
          _materialPageRoute(page), (route) => route.isFirst);

  static void pop() => navigatorKey.currentState!.pop();
}

// class SlideLeftPageRoute extends PageRouteBuilder {
//   final Widget child;
//   SlideLeftPageRoute(this.child)
//       : super(
//           transitionDuration: const Duration(milliseconds: 500),
//           pageBuilder: (BuildContext context, Animation<double> animation,
//                   Animation<double> secondaryAnimation) =>
//               child,
//         );
//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     return SlideTransition(
//       position: Tween<Offset>(
//         begin: Offset(context.locale == const Locale('ar') ? 1 : -1, 0),
//         end: Offset.zero,
//       ).animate(animation),
//       child: child,
//     );
//   }
// }
