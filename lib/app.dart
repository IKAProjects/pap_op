import 'package:flutter/material.dart';
import 'package:pap_op/resources/app_colors.dart';
import 'package:pap_op/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pap Op',
        theme: ThemeData(
          fontFamily: 'Sf Pro',
          highlightColor: Colors.transparent,
          splashColor: AppColors.whiteF1F3F6,
          splashFactory: NoSplash.splashFactory,
        ),
        home: const Splash(),

    );
  }
}