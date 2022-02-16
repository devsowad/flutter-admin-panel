import 'package:dashboard/constants.dart';
import 'package:dashboard/models/my_files.dart';
import 'package:dashboard/responsive.dart';
import 'package:dashboard/screens/dashboard/components/header.dart';
import 'package:dashboard/screens/dashboard/components/my_files.dart';
import 'package:dashboard/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(children: [
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
        ]),
      ),
    );
  }
}
