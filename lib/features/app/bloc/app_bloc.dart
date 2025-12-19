import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/features/app/bloc/app_event.dart';
import 'package:wordsnap/features/app/bloc/app_state.dart';
import 'package:wordsnap/features/settings/data/repositories/setting_repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SettingRepository settingRepository;

  AppBloc({required this.settingRepository}) : super(AppLoadingState()) {
    on<AppInit>(_onAppInit);
    on<OnboardCompleted>(_onOnboardCompleted);
    on<ResetApp>(_resetApp);
  }

  Future _onAppInit(AppInit event, Emitter<AppState> emit) async {
    emit(AppLoadingState());

    try {
      final settingModel = await settingRepository.getSetting();
      if (settingModel.isFirstLaunch) {
        emit(AppFirstLaunchState(settingModel: settingModel));
      } else {
        emit(AppReadyState());
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
      final settingModel = await settingRepository.getSetting();

      emit(AppReadyState());
    } catch (error) {
      emit(AppErrorState());
    }
  }

  Future _resetApp(ResetApp event, Emitter<AppState> emit) async {
    try {
      await settingRepository.resetApp();
      emit(AppLoadingState());
    } catch (_) {
      emit(AppErrorState());
    }
  }
}
