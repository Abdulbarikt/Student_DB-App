import 'dart:async';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeNavigateToAddEvent>(homeNavigateToAddEvent);
    on<HomeNavigateToStudentListEvent>(homeNavigateToStudentListEvent);
    on<HomeNavigateToSettingsEvent>(homeNavigateToSettingsEvent);
  }

  FutureOr<void> homeNavigateToAddEvent(
      HomeNavigateToAddEvent event, Emitter<HomeState> emit) {
    try {
      emit(HomeNavigateToAddingPageActionState());
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> homeNavigateToStudentListEvent(
      HomeNavigateToStudentListEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToStudentListPageActionState());
  }

  FutureOr<void> homeNavigateToSettingsEvent(HomeNavigateToSettingsEvent event, Emitter<HomeState> emit) {
    print("Settings clicked");
    emit(HomeNavigateToSettingActionState());
  }
}
