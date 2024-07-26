import 'dart:io';

import 'package:clean_arch_demo/core/constants/app_constants.dart';
import 'package:clean_arch_demo/core/constants/color_constants.dart';
import 'package:clean_arch_demo/core/network/network_service.dart';
import 'package:clean_arch_demo/src/auth/providers/auth_provider.dart';
import 'package:clean_arch_demo/src/demo/providers/demo_provider.dart';
import 'package:clean_arch_demo/src/home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/routes/router.dart';
import 'core/utils/size_config.dart';
import 'di_container.dart' as di;
import 'http_overrides.dart';
import 'src/splash/providers/splash_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  HttpOverrides.global = MyHttpOverrides();

  setPathUrlStrategy();
  runApp(MultiProvider(providers: [
    StreamProvider(create: (context) => di.sl<NetworkService>().controller.stream, initialData: NetworkStatus.offline),

    ///
    ///
    ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<DemoProvider>()),

    ///
    ///
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context2, Orientation orientation) {
            SizeConfig.init(constraints, orientation);
            return MaterialApp.router(
              /// TODO : CHANGE NAME IN APP_CONSTANTS
              title: AppConsts.appName,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,

              ///
              /// TODO : ADD THEME DATA AS PER YOUR NEED
              ///
              theme: ThemeData(
                  useMaterial3: false,
                  brightness: Brightness.light,
                  primaryColor: AppColors.theme,
                  dividerTheme: DividerThemeData(color: AppColors.black, thickness: 1, space: 0),
                  appBarTheme: AppBarTheme(
                    // backgroundColor: AppColor.theme,
                    // foregroundColor: AppColors.white,
                    iconTheme: IconThemeData(
                      color: AppColors.white,
                    ),
                    color: AppColors.theme,
                  ),
                  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.theme),
                  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: AppColors.theme))),
            );
          },
        );
      },
    );
  }
}
