import 'package:student_attendance/pages/bottomNavBar.dart';
import 'package:student_attendance/widgets/editProfilePhotoWidget.dart';
import 'package:student_attendance/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPrefrences.myUser;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: Text("Edit Profile"),
        ),
        // BuildAppBar(context),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            EditProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
            const SizedBox(height: 25),
            const SizedBox(height: 25),
            const SizedBox(height: 25),
            const SizedBox(height: 25),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginNavScreen()),
                          (route) => false,
                        ),
                      },
                  child: Text("Confirm"),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    fixedSize: Size(300, 60),
                  )),
            )
          ],
        ));
  }
}
