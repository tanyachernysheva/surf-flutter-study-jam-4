import 'package:flutter/material.dart';

class CenteredPositioned extends StatelessWidget {
  final Widget child;

  const CenteredPositioned({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        child: child,
      ),
    );
  }
}
