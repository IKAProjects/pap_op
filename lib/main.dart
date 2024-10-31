import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => const MyApp(),
    ),

  );
}
