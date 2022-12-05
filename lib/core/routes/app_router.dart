import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinitus/presentation/modules/screens/onboarding/splash_screen.dart';

import 'app_routes.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return _buildPageRoute(
        page: const SplashScreen(),
      );
      // ignore: dead_code
      break;
    default:
      return _errorRoute();
  }
}

Route _buildPageRoute({@required Widget? page}) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (builder) => page!);
  } else {
    return MaterialPageRoute(builder: (builder) => page!);
  }
}

Route _errorRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    },
  );
}
