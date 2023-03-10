part of '../screen_browser.dart';

class _UiButtons extends StatelessWidget {
  final bool isLoading;
  final void Function() onRefresh, onStop;
  final void Function()? onGoBack, onGoForward;

  const _UiButtons({
    required this.isLoading,
    required this.onRefresh,
    required this.onStop,
    this.onGoBack,
    this.onGoForward,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UiButton(
          icon: Icons.keyboard_arrow_left,
          onPressed: onGoBack,
        ),
        UiButton(
          icon: Icons.keyboard_arrow_right,
          onPressed: onGoForward,
        ),
        UiButton(
          icon: isLoading ? Icons.close : Icons.refresh,
          onPressed: onRefresh,
        ),
      ],
    );
  }
}
