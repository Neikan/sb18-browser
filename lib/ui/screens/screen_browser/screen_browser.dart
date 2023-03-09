// Flutter imports:
import 'package:app_browser/ui/components/ui_loader.dart';
import 'package:flutter/material.dart';

class ScreenBrowser extends StatelessWidget {
  const ScreenBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UiLoader(),
    );
  }
}
