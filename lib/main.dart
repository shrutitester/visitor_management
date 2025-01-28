import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/constants/stringConstants.dart';
import 'package:visitor_management/route/route_provide.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      theme: ThemeData(
        fontFamily: "DMSans",
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      initialRoute: RoutesLinks.decisionPage,
      onGenerateRoute: RoutesProvider.provideRoutes,
    );
  }
}
