import 'package:firebase_core/firebase_core.dart';
import 'package:student_attendance/pages/loginpages/loginPage.dart';
import 'package:student_attendance/theme/colors.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
        // canvasColor: primaryColor,
        primarySwatch: primaryColor,
        dividerColor: Colors.black);
    // DE0000
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Attendance',
      theme: themeData,
      home: LoginPage(),
      // Logout(),
      // LoginNavScreen(),
      // AttendanceDropdownPage1(),
      // AttendanceDropdownpage2(),
      // AttendancePage(),
      // ProfilePage(),
      // EditProfilePage(),
      // ChangePassword(),
      // ReportGeneration(),
      // ReportPdfDownloadPage(),
      // AdminPage(),
      // AdminReport(),
      // StudentDetailsPage(),
      // FacultyPage(),
      // FacultyDetailsPage(),
      // AddStud(),
      // EditStud(),
      // AddFaculty(),
      // EditFaculty(),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
