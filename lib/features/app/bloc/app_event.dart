import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashCompleted extends AppEvent {}

class OnboardCompleted extends AppEvent {}

class ResetApp extends AppEvent {}
