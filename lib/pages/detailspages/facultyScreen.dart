import 'package:student_attendance/models/userDetailModel.dart';
import 'package:student_attendance/pages/addPages/add_faculty.dart';
import 'package:student_attendance/widgets/profilePhotoWidget.dart';
import 'package:student_attendance/utils/names.dart';
import 'package:student_attendance/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

class FacultyPage extends StatefulWidget {
  const FacultyPage({Key? key}) : super(key: key);

  @override
  _FacultyPageState createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  // final user = UserPrefrences.myUser;
  final List<Department> user = UserPrefrences.FacultyList;
// var use2 = user.asMap();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculty"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // SizedBox(
            //   height: 35,
            // ),
            //   SearchBar(),
            // SizedBox(
            //   height: 15,
            // ),
            Expanded(
              child: new ListView.builder(
                  itemCount:
                      // Faculties.length,
                      user.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildFacultyCard(context, index)),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddFaculty()),
            );
          },
          elevation: 15,
          label: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          // icon: const Icon(Icons.thumb_up),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  buildFacultyCard(BuildContext context, int index) {
    List<bool> isActive = facultiesisActive;
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              ProfileWidget(imagePath: user[index].imagePath, size: 64),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      user[index].departmentName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Text(
                      user[index].departmentId,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text("Remove"),
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.white,
              //     onPrimary: Colors.grey[600],
              //   ),
              // ),
              Switch(
                value: isActive[index],
                onChanged: (bool newValue) {
                  setState(() {
                    isActive[index] = !isActive[index];
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
