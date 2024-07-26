import 'package:clean_arch_demo/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/routes/router.dart';
import '../config/routes/routes.dart';
import '../core/constants/color_constants.dart';

class AppScaffold extends StatefulWidget {
  final Widget child;

  const AppScaffold({super.key, required this.child});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

enum BottomNavItem {
  home(Icons.home, "Home", Routes.home),
  activity(Icons.message, "Demo", Routes.demo),
  profile(Icons.person, "Profile", Routes.profile);

  final IconData icon;
  final String title;
  final String route;

  const BottomNavItem(this.icon, this.title, this.route);
}

class _AppScaffoldState extends State<AppScaffold> {
  final router = AppRouter.router;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: BottomNavItem.values
            .map((e) => BottomNavigationBarItem(
                  icon: Icon(
                    e.icon,
                    color: GoRouterState.of(context).matchedLocation.startsWith('/${e.route}') ? AppColors.theme : AppColors.black,
                  ),
                  label: e.title,
                ))
            .toList(),
        unselectedItemColor: AppColors.black.withOpacity(0.5),
        selectedItemColor: AppColors.theme,
        currentIndex: BottomNavItem.values.firstWhere((element) => GoRouterState.of(context).matchedLocation.startsWith('/${element.route}')).index,
        selectedFontSize: 1.8.h,
        onTap: (index) => context.goNamed(BottomNavItem.values[index].route),
      ),
      body: Center(child: widget.child),
    );
  }
}
