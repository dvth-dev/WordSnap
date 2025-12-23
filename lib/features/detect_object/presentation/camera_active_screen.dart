import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/core/constants/app_colors.dart';
import 'package:wordsnap/core/widgets/text_widget.dart';
import 'package:wordsnap/features/detect_object/bloc/camera_state.dart';

import '../bloc/camera_bloc.dart';

class CameraActiveScreen extends StatefulWidget {
  const CameraActiveScreen({super.key});

  @override
  State<CameraActiveScreen> createState() => _CameraActiveScreenState();
}

class _CameraActiveScreenState extends State<CameraActiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Cho phép body tràn lên sau AppBar
      backgroundColor: AppColors.background3, // Nên để Colors.black để trông mượt hơn
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Icon back hoặc action nên xử lý ở đây
      ),
      body: BlocBuilder<CameraBloc, CameraState>(
        builder: (contextBuilder, state) {
          if (state is CameraLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CameraErrorState) {
            return Center(child: Text(state.messageError));
          }

          if (state is CameraReadyState) {
            // Lấy kích thước màn hình thiết bị
            final size = MediaQuery.of(contextBuilder).size;

            // Lấy tỷ lệ màn hình
            var scale = size.aspectRatio * state.controller.value.aspectRatio;

            // Nếu tỷ lệ < 1 (tức là camera đang bị hụt so với màn hình), cần đảo ngược lại scale
            if (scale < 1) scale = 1 / scale;

            return Stack(
              children: [
                // Cách 1: Dùng Transform.scale (Đơn giản, hiệu quả cao)
                Transform.scale(
                  scale: scale,
                  child: Center(
                    child: CameraPreview(state.controller),
                  ),
                ),

              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
