import 'package:student_attendance/pages/loginpages/logout.dart';
import 'package:student_attendance/pages/profilepages/adminPage.dart';
import 'package:student_attendance/pages/reportpages/adminreport.dart';
import 'package:student_attendance/pages/attendancePages/attendancePage.dart';
import 'package:student_attendance/pages/attendancePages/attendancedropdown1.dart';
import 'package:student_attendance/pages/attendancePages/attendancedropdownpage2.dart';
import 'package:student_attendance/pages/bottomNavBar.dart';
import 'package:student_attendance/pages/editpages/changePasswordPage.dart';
import 'package:student_attendance/widgets/datepicker.dart';
import 'package:student_attendance/pages/editpages/editProfilePages.dart';
import 'package:student_attendance/pages/editpages/edit_faculty.dart';
import 'package:student_attendance/pages/editpages/edit_student.dart';
import 'package:student_attendance/pages/detailspages/facultyDetailpage.dart';
import 'package:student_attendance/pages/detailspages/facultyScreen.dart';
import 'package:student_attendance/pages/profilepages/profilepage.dart';
import 'package:student_attendance/pages/reportpages/reportGeneration.dart';
import 'package:student_attendance/pages/reportpages/reportPdfDownload.dart';
import 'package:student_attendance/pages/detailspages/studentDetailspage.dart';
import 'package:student_attendance/pages/loginpages/loginPage.dart';
import 'package:student_attendance/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
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
      // AttendenceDropdownPage1(),
      // AttendenceDropdownpage2(),
      // AttendencePage(),
      // ProfilePage(),
      // EditProfilePage(),
      // ChangePassword(),
      // ReportGenration(),
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
