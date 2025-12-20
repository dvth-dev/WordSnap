import 'package:flutter/material.dart';
import 'package:wordsnap/core/constants/app_colors.dart';
import 'package:wordsnap/core/constants/app_dimens.dart';
import 'package:wordsnap/core/widgets/text_widget.dart';
import 'package:wordsnap/features/onboard/data/models/onboard_model.dart';

class OnboardPageWidget extends StatelessWidget {
  const OnboardPageWidget({super.key, required this.onboardModel});

  final OnboardModel onboardModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contextBuilder, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 250,
                  margin: EdgeInsets.only(bottom: Dimens.p32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    onboardModel.imageUrl,

                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.p32),
                  child: TextWidget(
                    onboardModel.title,
                    color: AppColors.title,
                    fontWeight: FontWeight.w700,
                    fontSize: Dimens.f24,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.p32,
                    vertical: Dimens.p8,
                  ),
                  child: TextWidget(
                    onboardModel.subTitle,
                    color: AppColors.subTitle,
                    fontWeight: FontWeight.w400,
                    fontSize: Dimens.f12,
                    textAlign: TextAlign.center,
                    maxLines: 10,
                  ),
                ),
                SizedBox(height: kToolbarHeight,)
              ],
            ),
          ),
        );
      },
    );
  }
}
