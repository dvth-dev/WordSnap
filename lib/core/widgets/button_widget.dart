import 'package:flutter/material.dart';
import 'package:wordsnap/core/widgets/text_widget.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = Dimens.buttonHeight,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.borderRadius = 100, // pill shape
    this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child:
            child ??
            TextWidget(title, color: textColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
