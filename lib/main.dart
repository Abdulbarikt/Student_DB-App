import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app_main_project__/utils/constants/app_themes.dart';
import 'package:student_app_main_project__/utils/constants/routing.dart';

import 'controller/addstudent/bloc/details/bloc/details_bloc.dart';
import 'controller/addstudent/bloc/home/bloc/home_bloc.dart';
import 'controller/addstudent/bloc/studentlist/bloc/students_bloc.dart';
import 'controller/addstudent/bloc/theme/bloc/theme_bloc.dart';

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
          BlocProvider(
            create: (context) => StudentsBloc(),
          ),
          BlocProvider(
            create: (context) => DetailsBloc(),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(),
          )
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter singleton = AppRouter.instance;
    var router = singleton.router;
    return SafeArea(
      child: BlocBuilder<ThemeBloc , ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Student App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
