import 'package:flutter/material.dart';

class InkwellWidget extends StatelessWidget {
  const InkwellWidget({super.key, required this.child, this.onTap});

  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: child,
    );
  }
}
