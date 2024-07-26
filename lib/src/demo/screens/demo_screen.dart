import 'package:clean_arch_demo/core/constants/color_constants.dart';
import 'package:clean_arch_demo/core/network/network_checker_widget.dart';
import 'package:clean_arch_demo/core/utils/text.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkCheckerWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Txt("Demo Screen", textColor: AppColors.white),
        ),
        body: SafeArea(
          child: Center(
            child: Txt("Demo Screen "),
          ),
        ),
      ),
    );
  }
}
