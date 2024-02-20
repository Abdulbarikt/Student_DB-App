part of 'students_bloc.dart';

class StudentsState {}

class StudentsActionState extends StudentsState {}

class StudentsInitial extends StudentsState {}

class StudentsLoadingState extends StudentsState {}

class StudentsLoadedState extends StudentsState {
  final List<Map<String, dynamic>> students;

  StudentsLoadedState({required this.students});
}

class StudentsErrorState extends StudentsState {}

class StudentAddedState extends StudentsState {}

class NavigateToStudentsDetailsPageActionState extends StudentsActionState {
  final int index;
  NavigateToStudentsDetailsPageActionState({required this.index});
}

class NavigateToStudentsEditPageActionState extends StudentsActionState {}

class StudentDeletedActionState extends StudentsActionState {}
