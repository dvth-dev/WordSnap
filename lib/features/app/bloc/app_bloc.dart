import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/features/app/bloc/app_event.dart';
import 'package:wordsnap/features/app/bloc/app_state.dart';
import 'package:wordsnap/features/settings/data/repositories/setting_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SettingRepository settingRepository;

  AppBloc({required this.settingRepository}) : super(AppSplashState()) {
    on<SplashCompleted>(_onSplashCompleted);
    on<OnboardCompleted>(_onOnboardCompleted);
    on<ResetApp>(_resetApp);
  }

  Future _onSplashCompleted(
    SplashCompleted event,
    Emitter<AppState> emit,
  ) async {
    try {
      final settingModel = await settingRepository.getSetting();
      if (settingModel.isFirstLaunch) {
        emit(AppOnboardState(settingModel: settingModel));
      } else {
        emit(AppHomeState());
      }
    } catch (error) {
      emit(AppErrorState());
    }
  }

  Future _onOnboardCompleted(
    OnboardCompleted event,
    Emitter<AppState> emit,
  ) async {
    try {
      await settingRepository.completeOnboard();

      emit(AppHomeState());
    } catch (error) {
      emit(AppErrorState());
    }
  }

  Future _resetApp(ResetApp event, Emitter<AppState> emit) async {
    try {
      await settingRepository.resetApp();
      emit(AppSplashState());
    } catch (_) {
      emit(AppErrorState());
    }
  }
}
