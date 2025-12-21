import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/core/constants/app_colors.dart';
import 'package:wordsnap/core/constants/app_dimens.dart';
import 'package:wordsnap/core/widgets/button_widget.dart';
import 'package:wordsnap/core/widgets/inkwell_widget.dart';
import 'package:wordsnap/core/widgets/text_widget.dart';
import 'package:wordsnap/features/app/bloc/app_bloc.dart';
import 'package:wordsnap/features/onboard/data/models/onboard_model.dart';
import 'package:wordsnap/features/onboard/widgets/onboard_page_widget.dart';

import '../app/bloc/app_event.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late final PageController _pageController;
  late final List<OnboardModel> listOnboard;
  late final int maxPage;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initData();
    _pageController = PageController(
      initialPage: _currentIndex,
      viewportFraction: 1,
    );

    _pageController.addListener(listenerPageView);
  }

  @override
  void dispose() {
    _pageController.removeListener(listenerPageView);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _appbar(context),
      bottomNavigationBar: _nextButton(context),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: listOnboard.length,
        itemBuilder: (_, index) {
          return OnboardPageWidget(onboardModel: listOnboard[index]);
        },
      ),
    );
  }

  void initData() {
    listOnboard = [
      OnboardModel(
        title: 'English in Real Life',
        subTitle: 'Learn vocabulary from the world around you, not textbooks.',
        imageUrl: 'assets/images/onboard-1.png',
      ),
      OnboardModel(
        title: 'Capture to Learn',
        subTitle: 'Snap everyday objects and grow your English vocabulary.',
        imageUrl: 'assets/images/onboard-2.png',
      ),

      OnboardModel(
        title: 'Save and Remember',
        subTitle:
            'Turn recognized objects into flashcards you can review anytime.',
        imageUrl: 'assets/images/onboard-3.png',
      ),
    ];

    maxPage = listOnboard.length;
  }

  void listenerPageView() {
    final page = (_pageController.page ?? 0).round();
    if (page != _currentIndex) {
      setState(() {
        _currentIndex = page;
      });
    }
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0.0,
      actions: [
        InkwellWidget(
          onTap: (){
            context.read<AppBloc>().add(OnboardCompleted());
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Dimens.p16),
            width: MediaQuery.of(context).size.width,
            child: TextWidget(
              'Skip',
              textAlign: TextAlign.end,
              fontSize: Dimens.f16,
              color: AppColors.title,
            ),
          ),
        ),
      ],
    );
  }

  Widget _nextButton(BuildContext context) {
    final bottomDeviceSpace = MediaQuery.of(context).padding.bottom;
    return ButtonWidget(
      title: 'Next ->',
      margin: EdgeInsets.only(
        left: Dimens.p32,
        right: Dimens.p32,
        bottom: Dimens.p24 + bottomDeviceSpace,
      ),
      onPressed: () {
        if (_currentIndex < maxPage - 1) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        } else {
          context.read<AppBloc>().add(OnboardCompleted());
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5.0,
        children: [
          TextWidget(
            _currentIndex == maxPage - 1 ? 'Get Started' : 'Next',
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          Icon(Icons.arrow_right_alt_outlined, color: AppColors.white),
        ],
      ),
    );
  }
}
