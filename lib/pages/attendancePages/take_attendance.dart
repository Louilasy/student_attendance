import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_attendance/models/userDetailModel.dart';
import 'package:student_attendance/services/local_auth_api.dart';
import 'package:student_attendance/utils/geoloacation.dart';
import 'package:student_attendance/utils/helpers.dart';
import 'package:student_attendance/widgets/dropDownWidget.dart';
import 'package:student_attendance/utils/names.dart';
import 'package:flutter/material.dart';
import 'package:student_attendance/widgets/getData.dart';
import 'package:geolocator/geolocator.dart';

class TakeAttendencePage extends StatefulWidget {
  const TakeAttendencePage({Key? key}) : super(key: key);

  @override
  _TakeAttendencePageState createState() => _TakeAttendencePageState();
}

class _TakeAttendencePageState extends State<TakeAttendencePage> {
  DateTime selectedDate = DateTime.now();
  bool deviceHasBiometrics = false;
  final user = FirebaseAuth.instance.currentUser;

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
        title: Text("Take Attendence"),
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
                                    if (await isWithinGeolocation()) {
                                      final isAuthenticated =
                                          await LocalAuthApi.authenticate();
                                      if (isAuthenticated) {
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
                                          userId: user!.uid,
                                          year: yeardropdownValue,
                                          createdAt: DateTime.now(),
                                          semester: semesterdropdownValue,
                                          course: courseDropdownValue,
                                        ));
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ShowAttendance(user!.uid)),
                                        );
                                      }
                                    } else
                                      showSnackBarMessage(
                                          context, 'You are not in class');
                                  },
                                  child: Text("Take Attendance")),
                              ElevatedButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Biometrics Availability'),
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

  Future<bool> isWithinGeolocation() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    If(isLocationServiceEnabled) {
      return Geolocator.getCurrentPosition();
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double distanceA = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      pointA.latitude,
      pointA.longitude,
    );

    double distanceB = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      pointB.latitude,
      pointB.longitude,
    );

    double distanceC = Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      pointC.latitude,
      pointC.longitude,
    );

    double effectiveDistance = Geolocator.distanceBetween(
          pointA.latitude,
          pointA.longitude,
          pointC.latitude,
          pointC.longitude,
        ) /
        2;

    return (distanceA < effectiveDistance) ||
        (distanceB < effectiveDistance) ||
        (distanceC < effectiveDistance);
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
