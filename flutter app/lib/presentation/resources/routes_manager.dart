// import 'package:emad_app/presentation/forgot_password/forgot_password_view.dart';
import 'package:emad_app/presentation/login/view/login_view.dart';
import 'package:emad_app/presentation/main/main_view.dart';
import 'package:emad_app/presentation/onboarding/view/onboarding_view.dart';
// import 'package:emad_app/presentation/register/view/register_view.dart';
import 'package:emad_app/presentation/resources/strings_manager.dart';
import 'package:emad_app/presentation/splash/splash_view.dart';
// import 'package:emad_app/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';
import '../../app/di.dart';
import 'package:easy_localization/easy_localization.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case Routes.mainRoute:
        initHomeModule();
        initProductModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound.tr()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.tr())),
            ));
  }
}
