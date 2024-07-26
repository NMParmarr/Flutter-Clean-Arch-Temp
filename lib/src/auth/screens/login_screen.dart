import 'package:clean_arch_demo/config/routes/routes.dart';
import 'package:clean_arch_demo/core/common/widgets/custom_elevated_button.dart';
import 'package:clean_arch_demo/core/constants/color_constants.dart';
import 'package:clean_arch_demo/core/network/network_checker_widget.dart';
import 'package:clean_arch_demo/core/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkCheckerWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Txt("Login Screen", textColor: AppColors.white),
        ),
        body: SafeArea(
          child: Center(
            child: CustomElevatedButton(
              child: Txt("Login Without Email & Password", textColor: AppColors.white),
              onTap: () {
                context.goNamed(Routes.home);
              },
            ),
          ),
        ),
      ),
    );
  }
}
