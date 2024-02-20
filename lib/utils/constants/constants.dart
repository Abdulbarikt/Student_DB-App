import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static MaterialAccentColor themeColor = Colors.deepPurpleAccent;
  static String imageHeroTag = "image";
  static Icon deleteIcon = const Icon(Icons.delete);
  static Icon settings = const Icon(Icons.settings);
  static Icon editIcon = const Icon(Icons.edit);
  static SizedBox heightSized = const SizedBox(height: 30);
  static SizedBox widthtSized = const SizedBox(width: 5);
  static String idString = 'id';
  static String nameString = 'name';
  static String ageString = 'age';
  static String addressString = 'address';
  static String divisionString = 'division';
  static String bloodString = 'bloodgroup';
  static String contactString = 'contact';
  static String imageString = 'image';
  static EdgeInsets cardPadding =
      const EdgeInsets.only(top: 20, left: 20, right: 20);
      
  // ----------theme-----------------
  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    primaryColor: Colors.teal,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    useMaterial3: true,
  );

  // ------------addscreen---------------------------
  static Text addAppBarTitle = const Text("Add Student");
  static Text addFormTitle = Text("Enter details",
      style: GoogleFonts.secularOne(textStyle: const TextStyle(fontSize: 30)));
  static SnackBar addstudentSnackbar =
      const SnackBar(content: Text('Student Added'));
  static EdgeInsets addStudentPadding =
      const EdgeInsets.only(top: 50, left: 30, right: 30);

//----------------detailsScreen-----------------------
  static SnackBar detailstudentSnackbar =
      const SnackBar(content: Text('Student Details Updated'));
  static EdgeInsets detailsPadding =
      const EdgeInsets.only(top: 100, left: 30, right: 30);
  static double detailsContainerHeight = 150;
  static CircleAvatar detailsCircleAvatarBg = const CircleAvatar(
    radius: 80,
    backgroundColor: Colors.white,
  );

  // ---------cardmenu-------
  static TextStyle cartTextStyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w300);
  static CircleAvatar cardCircleAvatar = const CircleAvatar(
      maxRadius: 10, child: Icon(Icons.arrow_forward_ios_rounded, size: 10));

// ----------home---------
  static String addCardmenuImageLogo = "assets/svg/addstudent.svg";
  static String viewCardmenuImageLogo = "assets/svg/viewstudent.svg";
  static String addStudentString = "Add Student";
  static String viewStudentString = "View Students";
  static Text homeTitleString = const Text("Student App");

// -----------studentsScreen------
  static EdgeInsets paddingStudentsScreen =
      const EdgeInsets.only(top: 10, left: 10, right: 10);
  static Color tiileColor = const Color.fromARGB(255, 213, 195, 244);
  static Text studentListTitle = const Text("Student List");
  
// -----------form----------
  static Text imageButtonText = const Text("Pick Image");
  static String nameHint = 'Enter name';
  static String ageHint = 'Enter age';
  static String addressHint = 'Enter address';
  static String divisionHint = 'Enter batch';
  static String bloodHint = 'Enter blood group';
  static String numberHint = 'Enter phone number';
  static Text addButtonText = const Text("Add");
  static Text updateButtonText = const Text("Update");
}

class RoutingConstants {
  static String homeRouteName = 'home';
  static String homeRoutePath = '/';

  static String settingsRouteName = 'settings';
  static String settingsRoutePath = '/settings';

  static String addstudentsRouteName = 'addstudents';
  static String addstudentsRoutePath = '/addstudents';

  static String studentlistRouteName = 'studentlist';
  static String studentlistRoutePath = '/studentlist';
  
  static String detailsRouteName = 'details';
  static String detailsRoutePath = '/details';
  
  

}
