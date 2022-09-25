import 'package:flutter/material.dart';

List<String> programmes = ["B.Sc", "MBA", "B.A", "B.Com"];
List<String> school = [
  "SCSIT",
  "SAME",
];
// List<String> Year = ["2021", "2022"];
List<String> semesters = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
];

List<String> subject = [
       "Artificial Intelligence",
       "Computer Architecture",
       "Introduction To Electronic",
       "Introduction To Structured Programming Design",
       "Circuit Theory",
       "Discrete Mathematics",
       "Introduction To Economics",
       "Discrete Mathematics",
       "Computer Graphics",
       "Database Concepts and Technologies I",
       "Data Structures"



];
List<String> students = [
  "Aardhya",
  "Aashiv",
  "Aayush",
  "Abhinay",
  "Aditya",
  "Ashish Kumar Singh Sengar",
  "Akshat",
  "Alabhya",
  "Anand",
  "Anirudh",
  "Archana ",
  "Archit",
  "Arpit",
  "Charudatta",
  "Dipesh",
  "Divesh",
  "Dushyant",
  "Devanshu"
];
List<String> date = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  "13",
  "14",
  "15",
  "16",
  "17",
  "18",
  "19",
  "20",
  "21"
];
List<String> collegeYear = [
  "1st",
  "2nd",
  "3rd",
];
List<String> enrollment = [
  "2019btcs001",
  "2019btcs002",
  "2019btcs003",
  "2019btcs004",
  "2019btcs005",
  "2019btcs006",
  "2019btcs007",
  "2019btcs008",
  "2019btcs009",
  "2019btcs010",
  "2019btcs011",
  "2019btcs012",
  "2019btcs013",
  "2019btcs014",
  "2019btcs015",
  "2019btcs016",
  "2019btcs017",
  "2019btcs018",
  "2019btcs019"
];
List<String> studentEmail = [
  "2019btcs001@student.suas.ac.in",
  "2019btcs002@student.suas.ac.in",
  "2019btcs003@student.suas.ac.in",
  "2019btcs004@student.suas.ac.in",
  "2019btcs005@student.suas.ac.in",
  "2019btcs006@student.suas.ac.in",
  "2019btcs007@student.suas.ac.in",
  "2019btcs008@student.suas.ac.in",
  "2019btcs009@student.suas.ac.in",
  "2019btcs010@student.suas.ac.in",
  "2019btcs011@student.suas.ac.in",
  "2019btcs012@student.suas.ac.in",
  "2019btcs013@student.suas.ac.in",
  "2019btcs014@student.suas.ac.in",
  "2019btcs015@student.suas.ac.in",
  "2019btcs016@student.suas.ac.in",
  "2019btcs017@student.suas.ac.in",
  "2019btcs018@student.suas.ac.in",
  "2019btcs019@student.suas.ac.in"
];
List<String> facultyDOB = ["11/11/99"];
List<String> facultiesID = [
  "Facultybtcs001",
];
List<String> facultiesEmailID = [
  "Facultybtcs001@suas.ac.in",
];
List<String> phoneNo = ["9878768767"];
List<bool> studentisActive = [
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
];
List<bool> facultiesisActive = [
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
];
List<String> faculties = [
  "Neha Gupta",
  "Ashish bansal",
  "Manish Khule",
];

List<int> isSelectedList = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];
List attendencecolor = [
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
];
//  0, /*Absent*/    1, /*Present*/    2 /*Absent*/
String semesterdropdownValue = semesters[0];
String schooldropdownValue = school[0];
String subjectdropdownValue = subject[0];
String yeardropdownValue = collegeYear[0];
String programdropdownValue = programmes[0];

Map<String, String> values = {
  programdropdownValue: "MBA",
  semesterdropdownValue: "1",
  schooldropdownValue: "SCSIT",
  subjectdropdownValue: "Artificial Intelegence",
  yeardropdownValue: "3rd",
};
