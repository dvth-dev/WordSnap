import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/features/detect_object/bloc/camera_event.dart';
import 'package:wordsnap/features/detect_object/bloc/camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraController? _cameraController;

  CameraBloc() : super(CameraInitialState()) {
    on<InitialCamera>(_onInitialCamera);
    on<TakePicture>(_onTakePicture);
  }

  Future _onInitialCamera(
    InitialCamera event,
    Emitter<CameraState> emit,
  ) async {
    emit(CameraLoadingState());

    try {
      final cameras = await availableCameras();
      final camera = cameras.first;

      _cameraController = CameraController(
        camera,
        ResolutionPreset.veryHigh,
        enableAudio: false,
      );

      await _cameraController!.initialize();

      emit(CameraReadyState(_cameraController!));
    } catch (error) {
      emit(CameraErrorState(error.toString()));
    }
  }

  Future _onTakePicture(TakePicture event, Emitter<CameraState> emit) async {}

  @override
  Future<void> close() {
    _cameraController?.dispose();
    return super.close();
  }
}
