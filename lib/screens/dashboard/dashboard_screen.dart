import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dashboard/components/window_buttons.dart';
import 'package:dashboard/constants.dart';
import 'package:dashboard/responsive.dart';
import 'package:dashboard/screens/dashboard/components/header.dart';
import 'package:dashboard/screens/dashboard/components/my_files.dart';
import 'package:dashboard/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Theme.of(context).platform;

    return SafeArea(
      child: Column(
        children: [
          if (provider == TargetPlatform.windows ||
              provider == TargetPlatform.macOS ||
              provider == TargetPlatform.linux)
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  const WindowButtons()
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const Header(),
                    const SizedBox(height: defaultPadding),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyFiles(),
                        if (!Responsive.isMobile(context))
                          const SizedBox(width: defaultPadding),
                        if (!Responsive.isMobile(context))
                          const Expanded(flex: 2, child: StorageDetails()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
