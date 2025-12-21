import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wordsnap/features/home/bloc/home_event.dart';
import 'package:wordsnap/features/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeStarted>(_onHomeStarted);
    on<RequestCameraPermission>(_onRequestCameraPermission);
  }

  Future _onHomeStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(HomeReadyState());
  }

  Future _onRequestCameraPermission(
    RequestCameraPermission event,
    Emitter<HomeState> emit,
  ) async {
    final status = await Permission.camera.status;
    print('------$status');

    if (status.isGranted) {
      emit(CameraPermissionGranted());
    } else {
      //TODO: send request camera
      final resultRequest = await Permission.camera.request();

      if (resultRequest.isGranted) {
        emit(CameraPermissionGranted());
      } else {
        emit(
          CameraPermissionDenied(
            isPermanentlyDenied: resultRequest.isPermanentlyDenied,
          ),
        );
      }
    }
  }
}
