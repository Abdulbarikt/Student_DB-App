import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../model/students_database.dart';

part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  StudentsBloc() : super(StudentsInitial()) {
   
    on<StudentsInitialEvent>(onStudentsInitialEvent);

    on<StudentButtonNavigateEvent>(studentButtonNavigateEvent);

    on<StudentButtonClearEvent>(studentButtonClearEvent);

    on<DeleteClickedEvent>(deleteClickedEvent);

  }

   Future<void> onStudentsInitialEvent(
      StudentsInitialEvent event, Emitter<StudentsState> emit) async {
    emit(StudentsLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final dataList = await StudentDatabase.getAllStudents();
      emit(StudentsLoadedState(students: dataList));
    } catch (e) {
      emit(StudentsErrorState());
    }
  }

  FutureOr<void> studentButtonNavigateEvent(
      StudentButtonNavigateEvent event, Emitter<StudentsState> emit) {
    emit(NavigateToStudentsDetailsPageActionState(index: event.index));
  }

  FutureOr<void> studentButtonClearEvent(
      StudentButtonClearEvent event, Emitter<StudentsState> emit) async {
    await StudentDatabase.clearDb();
    final dataList = await StudentDatabase.getAllStudents();
    emit(StudentsLoadedState(students: dataList));
  }

  FutureOr<void> deleteClickedEvent(
      DeleteClickedEvent event, Emitter<StudentsState> emit) async {
    await StudentDatabase.deleteData(event.index);
    emit(StudentDeletedActionState());
  }
}
