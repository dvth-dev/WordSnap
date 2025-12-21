import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wordsnap/core/constants/app_colors.dart';
import 'package:wordsnap/core/constants/app_dimens.dart';
import 'package:wordsnap/core/constants/app_string.dart';
import 'package:wordsnap/core/router/router_paths.dart';
import 'package:wordsnap/core/widgets/button_widget.dart';
import 'package:wordsnap/core/widgets/text_widget.dart';
import 'package:wordsnap/features/app/bloc/app_event.dart';
import 'package:wordsnap/features/home/bloc/home_bloc.dart';
import 'package:wordsnap/features/home/bloc/home_event.dart';
import 'package:wordsnap/features/home/bloc/home_state.dart';

import '../../app/bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: listenerHomeBloc,
      builder: (contextBlocSummer, state) {
        if (state is HomeInitialState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          backgroundColor: AppColors.background2,
          bottomNavigationBar: _bottomAction(context),
          appBar: AppBar(
            backgroundColor: AppColors.background2,
            elevation: 0,
            leading: Container(
              margin: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: AppColors.background3,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset('assets/icons/ic_camera.svg', width: 5.0),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  AppString.appMainTitle,
                  color: AppColors.white,
                  fontSize: Dimens.f32,
                  fontWeight: FontWeight.w700,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextWidget(
                    AppString.appMainSubTitle,
                    color: AppColors.subTitle,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _bottomAction(BuildContext context) {
    final double bottomSpaceDevice = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 40.0 + bottomSpaceDevice),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15.0,
        children: [
          ButtonWidget(
            title: 'Take a photo',
            onPressed: () {
              GoRouter.of(context).push(RouterPath.cameraActive);
              // context.push(RouterPath.cameraActive);
              // context.read<HomeBloc>().add(RequestCameraPermission());
            },
            backgroundColor: AppColors.primary,
          ),
          ButtonWidget(
            title: 'My Flashcards',
            onPressed: () {},
            backgroundColor: AppColors.background3,
          ),
        ],
      ),
    );
  }

  void listenerHomeBloc(BuildContext context, Object? state) {
    if (state is HomeReadyState) {
      print("App is ready");
    }
    print('----------listenerHomeBloc: $state');
    if (state is CameraPermissionGranted) {
      context.go(RouterPath.cameraActive);
    }

    if (state is CameraPermissionDenied) {
      if (state.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Bạn cần cấp quyền Camera để tiếp tục")),
        );
        if (state.isPermanentlyDenied) {
          // Gợi ý mở cài đặt
          openAppSettings();
        }
      }
    }
  }

  navigatorCameraActive() async {}
}
