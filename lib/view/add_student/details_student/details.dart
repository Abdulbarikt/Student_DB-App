import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app_main_project__/utils/constants/widgets/form.dart';
import '../../../controller/addstudent/bloc/details/bloc/details_bloc.dart';
import '../../../utils/constants/constants.dart';



class StudentDetails extends StatefulWidget {
  final int index;
  const StudentDetails({super.key, required this.index});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  void initState() {
    detailsBloc.add(DetailsInitialEvent());
    super.initState();
  }

  DetailsBloc detailsBloc = DetailsBloc();
  bool enabled = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: detailsBloc,
        listenWhen: (previous, current) => current is DetailsActionstate,
        buildWhen: (previous, current) => current is! DetailsActionstate,
        listener: (context, state) {
          if (state is DetailsUpdatedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(Constants.detailstudentSnackbar);
          } else if (state is EditEnabledState) {
            enabled = !enabled;
            detailsBloc.add(DetailsInitialEvent());
          }
        },
        builder: (context, state) {
          if (state is DetailsLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is DetailsLoadedState) {
            var db = state.students;
            var img = db[widget.index][Constants.imageString];
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        detailsBloc.add(EditClickedEvent());
                      },
                      icon: Constants.editIcon),
                ],
              ),
              body: SingleChildScrollView(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: Constants.detailsContainerHeight,
                          color: Constants.themeColor,
                        ),
                        Container(
                          margin: Constants.detailsPadding,
                          width: double.infinity,
                          child: CustomFormWidget(
                            bloc: detailsBloc,
                            index: db[widget.index][Constants.idString],
                            option: false,
                            enabled: enabled,
                            name: db[widget.index][Constants.nameString],
                            age: db[widget.index][Constants.ageString],
                            address: db[widget.index][Constants.addressString],
                            batch: db[widget.index][Constants.divisionString],
                            bloodgroup: db[widget.index][Constants.bloodString],
                            contact: db[widget.index][Constants.contactString],
                            image: db[widget.index][Constants.imageString],
                          ),
                        ),
                        Constants.heightSized,
                      ],
                    ),
                    Positioned(
                      top: Constants.detailsContainerHeight / 2.1,
                      child: Constants.detailsCircleAvatarBg,
                    ),
                    Positioned(
                      top: Constants.detailsContainerHeight / 2,
                      child: CircleAvatar(
                        radius: Constants.detailsContainerHeight / 2,
                        backgroundImage: MemoryImage(img),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          }
        });
  }
}
