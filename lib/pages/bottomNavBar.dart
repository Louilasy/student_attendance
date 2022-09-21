import 'package:student_attendance/pages/loginpages/logout.dart';
import 'package:student_attendance/pages/profilepages/adminPage.dart';
import 'package:student_attendance/pages/attendancePages/attendancedropdown1.dart';
import 'package:student_attendance/pages/detailspages/facultyScreen.dart';
import 'package:student_attendance/pages/profilepages/profilepage.dart';
import 'package:student_attendance/pages/reportpages/adminreport.dart';
import 'package:student_attendance/pages/reportpages/reportGeneration.dart';
import 'package:student_attendance/theme/colors.dart';
import 'package:flutter/material.dart';

final List<Widget> defaultNavbar = [
  Home(),
  ReportGeneration(),
  ProfilePage(),
  Logout()
];

final List<Widget> adminNavbar = [
  AdminPage(),
  AdminReport(),
  FacultyPage(),
  Logout()
];

BottomNavigationBar buildDefaultBottomNavBar(int currentindex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: primaryColor,
    currentIndex: currentindex,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white70,
    onTap: (index) => {currentindex = index},
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_outlined),
        label: 'Attendence',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.description_outlined),
        label: 'Report',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.logout),
        label: 'Log Out',
      ),
    ],
  );
}

BottomNavigationBar buildAdminBottomNavBar(int currentindex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: primaryColor,
    currentIndex: currentindex,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white70,
    onTap: (index) => {currentindex = index},
    items: [
      BottomNavigationBarItem(
        // icon: Icon(Icons.support_agent),
        icon: Icon(Icons.local_police),
        label: 'Admin',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.description),
        label: 'Report',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.badge),
        label: 'Faculty',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.logout),
        label: 'Log Out',
      ),
    ],
  );
}

// Admin Bottom NavBar
class AdminNavScreen extends StatefulWidget {
  const AdminNavScreen({Key? key}) : super(key: key);

  @override
  _AdminNavScreenState createState() => _AdminNavScreenState();
}

class _AdminNavScreenState extends State<AdminNavScreen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: adminNavbar[currentindex],
        bottomNavigationBar: buildAdminBottomNavBar(currentindex));
  }
}

// Defult Bottom NavBar
class LoginNavScreen extends StatefulWidget {
  const LoginNavScreen({Key? key}) : super(key: key);

  @override
  _LoginNavScreenState createState() => _LoginNavScreenState();
}

class _LoginNavScreenState extends State<LoginNavScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: defaultNavbar[currentPage],
        bottomNavigationBar: buildDefaultBottomNavBar(currentPage));
  }
}
