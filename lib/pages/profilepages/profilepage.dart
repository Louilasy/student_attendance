import 'package:student_attendance/pages/profilepages/adminPage.dart';
import 'package:student_attendance/pages/editpages/changePasswordPage.dart';
import 'package:path/path.dart';

import 'package:student_attendance/model/userDetailModel.dart';
import 'package:student_attendance/pages/bottomNavBar.dart';
import 'package:student_attendance/pages/editpages/editProfilePages.dart';
import 'package:student_attendance/widgets/editbuttonWidget.dart';
import 'package:student_attendance/widgets/profilePhotoWidget.dart';
import 'package:student_attendance/theme/colors.dart';
import 'package:student_attendance/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    int currentindex = 0;
    final user = UserPrefrences.myUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Image.asset('assets/Logo_Login_Page.png'),
            ),
            const SizedBox(height: 20),
            ProfileWidget(
              imagePath: user.imagePath,
              size: 224,
            ),
            const SizedBox(height: 15),
            buildName(user),
            const SizedBox(height: 15),
            Center(child: buildEditButton(user, context)),
            const SizedBox(height: 15),
            Center(child: buildChangePassButton(user, context)),
            const SizedBox(height: 24),
            (false)
                ? Center(child: buildSwitchToAdminButton(user, context))
                : const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

Widget buildName(Department user) => Column(
      children: [
        Text(
          user.departmentName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email,
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
Widget buildEditButton(Department user, BuildContext context) => ButtonWidget(
      text: 'Edit Profile',
      icon: Icons.person,
      onClicked: () => {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EditProfilePage()),
        )
      },
    );
Widget buildChangePassButton(Department user, BuildContext context) =>
    ButtonWidget(
      text: 'Change Password',
      icon: Icons.lock,
      onClicked: () => {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ChangePassword()),
        )
      },
    );
Widget buildSwitchToAdminButton(Department user, BuildContext context) =>
    ButtonWidget(
      text: 'Switch to Admin',
      icon: Icons.switch_account,
      onClicked: () => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdminNavScreen()),
        )
      },
    );
