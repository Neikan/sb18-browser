// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_browser/ui/screens/screen_browser/screen_browser.dart';
import 'package:app_browser/ui/styles/themes.dart';

class UiApp extends StatelessWidget {
  const UiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      home: const ScreenBrowser(),
    );
  }
}
