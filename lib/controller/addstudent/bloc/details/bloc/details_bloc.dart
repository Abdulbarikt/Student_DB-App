import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:student_app_main_project__/model/students_database.dart';
import '../../../../../utils/constants/constants.dart';
part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsInitialEvent>(detailsInitialEvent);
    on<UpdateStudentEvent>(updateStudentEvent);
    on<EditClickedEvent>(editClickedEvent);
  }

  FutureOr<void> detailsInitialEvent(
      DetailsInitialEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsLoadingState());
    try {
      final datalist = await StudentDatabase.getAllStudents();
      emit(DetailsLoadedState(students: datalist));
    } catch (e) {
      emit(DetailsErrorState());
    }
  }

  FutureOr<void> updateStudentEvent(
      UpdateStudentEvent event, Emitter<DetailsState> emit) async {
    try {
      final Map<String, dynamic> data = {
        Constants.nameString: event.name,
        Constants.ageString: event.age,
        Constants.contactString: event.number,
        Constants.bloodString: event.bloodgrp,
        Constants.addressString: event.address,
        Constants.divisionString: event.division,
        Constants.imageString: event.image,
      };
      await StudentDatabase.updateData(event.index, data);
      emit(DetailsUpdatedState());
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> editClickedEvent(
      EditClickedEvent event, Emitter<DetailsState> emit) {
    emit(EditEnabledState());
  }
}
