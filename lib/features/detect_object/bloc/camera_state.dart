import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

abstract class CameraState extends Equatable {
  @override
  List<Object> get props => [];
}

class CameraInitialState extends CameraState {}

class CameraLoadingState extends CameraState {}

class CameraReadyState extends CameraState {
  final CameraController controller;

  CameraReadyState(this.controller);
}

class CameraErrorState extends CameraState {
  final String messageError;

  CameraErrorState(this.messageError);
}
