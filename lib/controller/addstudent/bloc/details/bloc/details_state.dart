part of 'details_bloc.dart';

class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsLoadedState extends DetailsState {
  final List<Map<String, dynamic>> students;

  DetailsLoadedState({required this.students});
}

class DetailsErrorState extends DetailsState {}

class DetailsActionstate extends DetailsState {}

class DetailsUpdatedState extends DetailsActionstate {}

class EditEnabledState extends DetailsActionstate {}
