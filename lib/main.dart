import 'package:flutter/material.dart';
import 'package:smart_home_app_ui/constants.dart';
import 'package:smart_home_app_ui/pages/home.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: <PointerDeviceKind>{
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      title: 'Smart Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: themeColor,
        ),
        fontFamily: "Ubuntu",
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
