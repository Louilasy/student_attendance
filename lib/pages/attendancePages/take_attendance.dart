import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_attendance/models/userDetailModel.dart';
import 'package:student_attendance/services/local_auth_api.dart';
import 'package:student_attendance/widgets/dropDownWidget.dart';
import 'package:student_attendance/utils/names.dart';
import 'package:flutter/material.dart';

class TakeAttendencePage extends StatefulWidget {
  const TakeAttendencePage({Key? key}) : super(key: key);

  @override
  _TakeAttendencePageState createState() => _TakeAttendencePageState();
}

class _TakeAttendencePageState extends State<TakeAttendencePage> {
  DateTime selectedDate = DateTime.now();
  bool deviceHasBiometrics = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  void initState() {
    super.initState();
    checkBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Attendence"),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Student Attendance",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey),
          )),
          Center(
              child: Text(
            "Please make sure your time is set correctly.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              color: Colors.red,
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Dropdown(
                  dropdownValue: semesterdropdownValue,
                  values: semesters,
                  hint: "Semester"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Dropdown(
                  dropdownValue: courseDropdownValue,
                  values: courses,
                  hint: "Subject"),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  // height: 300,
                  width: 350,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 0.80),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        // Text("Time",style: TextStyle(fontSize: 30),),
                        Text(
                          "${selectedDate.toLocal()}".split(' ')[0],
                          style: TextStyle(fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child:
                                      Text("Program : $programdropdownValue")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text("Year : $yeardropdownValue")),
                              Expanded(
                                  child:
                                      Text("Semester : $semesterdropdownValue"))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Center(
                                  child: Expanded(
                                      child: Text(
                                          "Subject : $courseDropdownValue")))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    final isAuthenticated =
                                        await LocalAuthApi.authenticate();
                                    if (isAuthenticated) {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           AttendencePage()),
                                      // );
                                      final attendanceRef = FirebaseFirestore
                                          .instance
                                          .collection('attendance')
                                          .withConverter<Attendance>(
                                            fromFirestore: (snapshot, _) =>
                                                Attendance.fromJson(
                                                    snapshot.data()!),
                                            toFirestore: (attendance, _) =>
                                                attendance.toJson(),
                                          );
                                      attendanceRef.add(Attendance(
                                        userId: 'kljkljlkj',
                                        year: '2022',
                                        createdAt: DateTime.now(),
                                        semester: semesterdropdownValue,
                                        course: courseDropdownValue,
                                      ));
                                      log(selectedDate.toIso8601String());
                                    }
                                  },
                                  child: Text("Take Attendence")),
                              ElevatedButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Availability'),
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            buildText('Biometrics',
                                                deviceHasBiometrics),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("Check")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  void checkBiometrics() async {
    deviceHasBiometrics = await LocalAuthApi.hasBiometrics();
  }

  Widget buildText(String text, bool checked) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            checked
                ? Icon(Icons.check, color: Colors.green, size: 24)
                : Icon(Icons.close, color: Colors.red, size: 24),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 24)),
          ],
        ),
      );
}
