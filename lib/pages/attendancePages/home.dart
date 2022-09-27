import 'package:student_attendance/pages/attendancePages/take_attendance.dart';
import 'package:student_attendance/widgets/dropDownWidget.dart';
import 'package:student_attendance/utils/names.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: new ListView(physics: BouncingScrollPhysics(), children: [
              Center(
                child: Image.asset('assets/Logo_Login_Page.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                "Student Attendance",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Dropdown(
                        dropdownValue: programdropdownValue,
                        hint: "Program",
                        values: programmes,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Dropdown(
                      //     dropdownValue: schooldropdownValue,
                      //     hint: "School",
                      //     values: school),
                      // SizedBox(
                      //   height: 20,
                      // ),

                      SizedBox(
                        height: 20,
                      ),
                      Dropdown(
                          dropdownValue: yeardropdownValue,
                          values: collegeYear,
                          hint: "Year"),
                      SizedBox(
                        height: 20,
                      ),
                      // dropdownButton(batchdropdownValue,Batch,"Batch"),
                      SizedBox(
                        height: 35,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => TakeAttendencePage()),
                          );
                        },
                        child: Text("Next"),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 60),
                            primary: Colors.grey[100],
                            onPrimary: Colors.black,
                            elevation: 10,
                            textStyle: TextStyle(fontSize: 20)),
                      )
                    ],
                  ))
            ])));
  }
}
