import 'dart:developer';

import 'package:emad/features/auth/ui/bloc/auth_bloc.dart';
import 'package:emad/features/croot/ui/widgets/resource/title_with_search.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:google_fonts/google_fonts.dart';
import 'app.dart';
import 'core/common/cubits/user/user_cubit.dart';
import 'core/constants/constants.dart';

// import 'core/theme/theme.dart';
// import 'features/croot/ui/pages/home.dart';
import 'features/croot/ui/bloc/customer/customer_bloc.dart';
import 'features/croot/ui/bloc/order/order_bloc.dart';
import 'features/croot/ui/bloc/product/product_bloc.dart';
import 'features/croot/ui/pages/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<UserCubit>()),
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider(create: (_) => serviceLocator<CustomerBloc>()),
      BlocProvider(create: (_) => serviceLocator<ProductBloc>()),
      BlocProvider(create: (_) => serviceLocator<OrderBloc>()),
    ],
    child: ModelBinding(
      child: MyApp(),
      initialModel: AppOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        customTextDirection: CustomTextDirection.localeBased,
        locale: null,
        timeDilation: timeDilation,
        platform: defaultTargetPlatform,
        isTestMode: false,
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  static late BuildContext context;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.light(useMaterial3: true);
    MyApp.context = context;
    // log(theme.colorScheme.toString());
    return MaterialApp(
      restorationScopeId: 'app',
      title: 'Croot app',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        inputDecorationTheme: theme.inputDecorationTheme
            .copyWith(border: const UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.none))),
        appBarTheme:
            theme.appBarTheme.copyWith(backgroundColor: Colors.white, elevation: 0, shadowColor: Colors.transparent),
        scaffoldBackgroundColor: Colors.grey.shade100,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            // backgroundColor: Colors.white,
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        colorScheme: theme.colorScheme.copyWith(
          // seedColor: Color(0xff21005d),
          primary: Colors.blueAccent,
          // primary: Color(0xff6750a4),

          // primaryContainer: Color(0xff21005d),
          primaryContainer: Colors.white,
          //   onPrimaryContainer: Colors.red,
          //   primaryFixed: Colors.red,
          //   primaryFixedDim: Colors.red,
          //   onPrimaryFixed: Colors.red,
          //   onPrimaryFixedVariant: Colors.red,
          //   secondary: Color(0xff625b71),
          //   onSecondary: Colors.red,
          //   secondaryContainer: Colors.red,
          //   onSecondaryContainer: Colors.red,
          //   secondaryFixed: Colors.red,
          //   secondaryFixedDim: Colors.red,
          //   onSecondaryFixed: Color(0xff1d192b),
          //   onSecondaryFixedVariant: Color(0xff4a4458),
          //   tertiary: Color(0xff7d5260),
          //   onTertiary: Colors.red,
          //   tertiaryContainer:Colors.red,
          //   onTertiaryContainer: Colors.red,
          //   tertiaryFixed: Colors.red,
          //   tertiaryFixedDim: Colors.red,
          //   onTertiaryFixed: Color(0xff31111d),
          //   onTertiaryFixedVariant: Color(0xff633b48),
          //   error: Color(0xffb3261e),
          //   errorContainer: Color(0xfff9dedc),
          //   onErrorContainer: Color(0xff410e0b),
          //   surface: Colors.white,

          // onSurface: Colors.white,
          // surfaceDim: Colors.white,
          // surfaceBright: Colors.white,
          surfaceContainerLow: Colors.white,
          surfaceContainer: Colors.white,
          //
          // surfaceContainerHigh: Colors.white,
          surfaceContainerHighest: Colors.grey.shade300,
          // onSurfaceVariant: Colors.red,
          // outline: Colors.red,
          // outlineVariant: Colors.red,
          // inverseSurface: Colors.red,
          // onInverseSurface: Color(0xfff5eff7),
          // inversePrimary: Colors.red,
          // surfaceTint: Color(0xff6750a4),
          // background: Color(0xfffef7ff),
          // onBackground: Color(0xff1d1b20), surfaceVariant: Color(0xffe7e0ec)
        ),
        shadowColor: Colors.black,
        // canvasColor: Colors.white,
        // primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocSelector<UserCubit, UserState, bool>(
        selector: (state) {
          return state is IsLogIn;
        },
        builder: (context, isLoggedIn) {
          log(isLoggedIn.toString());
          if (isLoggedIn) {
            return const IndexPage(
              title: '',
            );
          }
          return const LoginPage();
        },
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, AuthState state) {
            if (state case AuthInitial()) {
              context.read<AuthBloc>().add(AuthIsUserLoggedIn());
            }
            // TODO splash screen
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
