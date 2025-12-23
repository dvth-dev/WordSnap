import 'package:equatable/equatable.dart';

abstract class CameraEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialCamera extends CameraEvent {}

class TakePicture extends CameraEvent {}
