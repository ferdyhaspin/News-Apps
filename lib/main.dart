import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "News Apps",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // accentColor: COLOR_ACC,
        // primaryColor: COLOR_PRIMARY,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "InterRegular",
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
      ),
    ),
  );
}
