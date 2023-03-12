// Flutter imports:
import 'package:flutter/material.dart';

const _color = Colors.white;

class UiButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const UiButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: onPressed != null ? _color : _color.withOpacity(0.5),
      ),
      onPressed: onPressed,
    );
  }
}
