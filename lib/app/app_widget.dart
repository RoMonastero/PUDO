import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/app_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/consts/routers_consts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter GoFast',
          initialRoute: RoutersConst.login,
          theme: Modular.get<AppController>().themeApp.getTheme(),
          themeMode: Modular.get<AppController>().themeMode,
          navigatorKey: Modular.navigatorKey,
          onGenerateRoute: Modular.generateRoute,
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      },
    );
  }
}
