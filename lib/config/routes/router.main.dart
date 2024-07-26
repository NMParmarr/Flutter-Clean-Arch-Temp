part of 'router.dart';

GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// final _controller = ScrollController();
// final _bottomNavKey = GlobalKey<ScrollToHideWidgetState>();

class Screens {
  // static _demoScreen(String title) => SplashScreen(
  //       title: title,
  //       controller: _controller,
  //       bottomNavKey: _bottomNavKey,
  //     );
}

class AppRouter {
  AppRouter._();

  static GoRouter get router => _router;
  static final _router = GoRouter(
    initialLocation: Routes.root,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.root,
        pageBuilder: defaultPageBuilder((state) => SplashScreen()),
      ),

      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/${Routes.login}',
        name: Routes.login,
        pageBuilder: defaultPageBuilder((state) => LoginScreen()),
      ),

      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/${Routes.map}',
      //   name: Routes.map,
      //   pageBuilder: defaultPageBuilder(MapScreen()),
      // ),

      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: '/${Routes.paySlip}',
      //   name: Routes.paySlip,
      //   pageBuilder: defaultPageBuilder(PaySlipScreen()),
      // ),

      ///
      /// --- SHELL ROUTE - BOTTOM NAVIGATION ROUTE
      ///
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/${Routes.home}',
            name: Routes.home,
            pageBuilder: defaultPageBuilder((state) => HomeScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/${Routes.demo}',
            name: Routes.demo,
            pageBuilder: defaultPageBuilder((state) => DemoScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/${Routes.profile}',
            name: Routes.profile,
            pageBuilder: defaultPageBuilder((state) => ProfileScreen()),
          ),
        ],
      ),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(Widget Function(GoRouterState state) child) => (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(
        context: context,
        state: state,
        child: child(state),
      );
    };
