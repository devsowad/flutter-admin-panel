import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dashboard/constants.dart';
import 'package:dashboard/controllers/menu_controller.dart';
import 'package:dashboard/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    const minSize = Size(500, 450);
    appWindow.minSize = minSize;
    appWindow.title = 'Admin Panel with Flutter';
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      themeMode: ThemeMode.dark,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuController()),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
