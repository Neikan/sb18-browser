// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:webview_flutter/webview_flutter.dart';

// Project imports:
import 'package:app_browser/consts/common.dart';
import 'package:app_browser/consts/translations.dart';
import 'package:app_browser/ui/components/ui_button.dart';
import 'package:app_browser/ui/components/ui_header.dart';

part 'components/ui_buttons.dart';
part 'components/ui_field.dart';

class ScreenBrowser extends StatefulWidget {
  const ScreenBrowser({super.key});

  @override
  State<ScreenBrowser> createState() => _ScreenBrowserState();
}

class _ScreenBrowserState extends State<ScreenBrowser> {
  bool _isLoading = false;
  bool _isCanGoForward = false;
  bool _isCanGoBack = false;

  final _controllerField = TextEditingController(text: urlHome);

  late final WebViewController _controllerWebView;

  @override
  void initState() {
    super.initState();

    _controllerWebView = _getControllerWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiHeader(
        child: Row(
          children: [
            _UiButtons(
              isLoading: _isLoading,
              onGoBack: _isCanGoBack ? _handleGoBack : null,
              onGoForward: _isCanGoForward ? _handleGoForward : null,
              onRefresh: _handleRefresh,
              onStop: _handleStop,
            ),
            _UiField(
              controller: _controllerField,
              onSearch: _handleSubmitted,
            ),
          ],
        ),
      ),
      body: WebViewWidget(
        controller: _controllerWebView,
      ),
    );
  }

  WebViewController _getControllerWebView() => WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.white)
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (String url) async {
          _isCanGoForward = await _controllerWebView.canGoForward();
          _isCanGoBack = await _controllerWebView.canGoBack();

          setState(() => _isLoading = false);
        },
      ),
    )
    ..loadRequest(Uri.parse(_controllerField.text));

  Future<void> _handleGoBack() async {
    setState(() => _isLoading = true);

    await _controllerWebView.goBack();
  }

  Future<void> _handleGoForward() async {
    setState(() => _isLoading = true);

    await _controllerWebView.goForward();
  }

  Future<void> _handleRefresh() async {
    final url = _controllerField.text.trim();

    if (url.isNotEmpty) {
      setState(() => _isLoading = true);

      await _controllerWebView.loadRequest(Uri.parse(url));
    }

    if (_isLoading) {
      await _controllerWebView.goBack();
    }
  }

  Future<void> _handleStop() async {
    await _controllerWebView.goBack();
  }

  void _handleSubmitted() {
    _controllerWebView.loadRequest(Uri.parse(_controllerField.text));

    FocusScope.of(context).unfocus();
  }
}
