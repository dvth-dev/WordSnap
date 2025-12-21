import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeReadyState extends HomeState {}

class CameraPermissionGranted extends HomeState {}

class CameraPermissionDenied extends HomeState {
  final bool isPermanentlyDenied;

  CameraPermissionDenied({required this.isPermanentlyDenied});
}
