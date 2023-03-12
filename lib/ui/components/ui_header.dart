// Flutter imports:
import 'package:flutter/material.dart';

class UiHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final Widget? leading;
  final List<Widget>? actions;

  const UiHeader({
    super.key,
    required this.child,
    this.leading,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64.0);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: child,
      leading: leading,
      actions: actions,
    );
  }
}
