import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:student_app_main_project__/model/students_database.dart';

part 'add_student_event.dart';
part 'add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(AddStudentInitialState()) {
    on<AddClickedEvent>(onAddClickedEvent);
  }

  FutureOr<void> onAddClickedEvent(
      AddClickedEvent event, Emitter<AddStudentState> emit) async {
    try {
      String name = event.name;
      int age = event.age;
      String bloodgroup = event.bloodgrp;
      String contact = event.number;
      String division = event.division;
      String address = event.address;
      var image = event.image;

      await StudentDatabase.insertStudent(
          name: name,
          age: age,
          contact: contact,
          bloodgroup: bloodgroup,
          address: address,
          division: division,
          imageBytes: image);
      emit(AddStudentAddedState());
    } catch (e) {
      emit(AddStudentErrorState());
    }
  }
}
