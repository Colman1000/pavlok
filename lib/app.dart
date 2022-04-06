import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pavlok/config/constants.dart';
import 'package:pavlok/config/intl.dart';
import 'package:pavlok/config/theme.dart';
import 'package:pavlok/widgets/radial_timer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: MyTheme.themeMode,
      scaffoldMessengerKey: Constants.scaffoldMessengerKey,
      // getPages: Routes.all,
      // initialRoute: Routes.initial,
      home: Scaffold(
        body: Center(
          child: RadialTimer(),
        ),
      ),
      translations: Intl(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
