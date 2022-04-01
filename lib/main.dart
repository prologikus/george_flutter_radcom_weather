import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

TextTheme getTextTheme(ColorScheme colorScheme) {
  //TEXT
  return TextTheme(
    headline3: GoogleFonts.nunito(
      color: colorScheme.onBackground,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    ),
    headline4: GoogleFonts.nunito(
      color: colorScheme.onBackground,
      fontWeight: FontWeight.w700,
      fontSize: 15,
    ),
    headline5: GoogleFonts.nunito(
      color: colorScheme.onBackground,
      fontWeight: FontWeight.w800,
      fontSize: 15,
    ),
    headline6: GoogleFonts.nunito(
      color: colorScheme.onBackground,
      fontWeight: FontWeight.w900,
      fontSize: 15,
    ),
  );
}

ThemeData getMyTheme(Brightness? brightness) {
  brightness ??= Get.window.platformBrightness;

  var lightColorScheme = const ColorScheme.light();

  var darkColorScheme = const ColorScheme.dark();

  if (brightness == Brightness.dark) {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: getTextTheme(darkColorScheme),
      colorScheme: darkColorScheme,
    );
  }

  return ThemeData.light().copyWith(
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: lightColorScheme,
    textTheme: getTextTheme(lightColorScheme),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Radcom Weather',
      debugShowCheckedModeBanner: false,
      theme: getMyTheme(Brightness.light),
      darkTheme: getMyTheme(Brightness.dark),
      themeMode: ThemeMode.light,
      translations: AppTranslations(),
      locale: const Locale('ro', 'RO'),
      fallbackLocale: const Locale('en', 'EN'),
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      home: const HomePage(),
    );
  }
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'Radcom Weather',
        },
        'ro_RO': {
          'app_title': 'Radcom Weather',
        }
      };
}
