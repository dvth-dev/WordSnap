import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordsnap/features/home/bloc/home_event.dart';
import 'package:wordsnap/features/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeStarted>(_onHomeStarted);
  }

  Future _onHomeStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(HomeReadyState());
  }
}
