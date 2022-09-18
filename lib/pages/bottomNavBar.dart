import 'package:student_attendance/pages/loginpages/logout.dart';
import 'package:student_attendance/pages/profilepages/adminPage.dart';
import 'package:student_attendance/pages/attendancePages/attendancedropdown1.dart';
import 'package:student_attendance/pages/detailspages/facultyScreen.dart';
import 'package:student_attendance/pages/profilepages/profilepage.dart';
import 'package:student_attendance/pages/reportpages/adminreport.dart';
import 'package:student_attendance/pages/reportpages/reportGeneration.dart';
import 'package:student_attendance/theme/colors.dart';
import 'package:flutter/material.dart';

final List<Widget> facultynavbar = [
  Home(),
  ReportGeneration(),
  ProfilePage(),
  Logout()
];

final List<Widget> adminnavbar = [
  AdminPage(),
  AdminReport(),
  FacultyPage(),
  Logout()
];

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
      body: facultynavbar[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        currentIndex: currentPage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) => setState(() => currentPage = index),
        items: [
          BottomNavigationBarItem(
            // icon: Icon(Icons.support_agent),
            icon: Icon(Icons.home),
            label: 'Home',
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
      ),
    );
  }
}

BottomNavigationBar BuildFacultyBottomNavBar(int currentindex) {
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

BottomNavigationBar BuildAdminBottomNavBar(int currentindex) {
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

class AdminNavScreen extends StatefulWidget {
  const AdminNavScreen({Key? key}) : super(key: key);

  @override
  _AdminNavScreenState createState() => _AdminNavScreenState();
}

class _AdminNavScreenState extends State<AdminNavScreen> {
  int currentadmin = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: adminnavbar[currentadmin],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          currentIndex: currentadmin,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index) => setState(() => currentadmin = index),
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
        ));
  }
}
