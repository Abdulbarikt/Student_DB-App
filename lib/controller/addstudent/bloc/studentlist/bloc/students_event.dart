part of 'students_bloc.dart';

class StudentsEvent {}

class StudentsInitialEvent extends StudentsEvent {}

class ViewStudentButtonClickedEvent extends StudentsEvent {}

class StudentButtonNavigateEvent extends StudentsEvent {
  int index;

  StudentButtonNavigateEvent({required this.index});
}

class StudentButtonClearEvent extends StudentsEvent {}

class EditStudentButtonClickedEvent extends StudentsEvent {}

class DeleteClickedEvent extends StudentsEvent {
  var index;


  DeleteClickedEvent({required this.index});
}
