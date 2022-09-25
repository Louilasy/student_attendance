import 'package:student_attendance/widgets/dropDownWidget.dart';
import 'package:student_attendance/pages/reportpages/reportPdfDownload.dart';
import 'package:student_attendance/utils/names.dart';
import 'package:flutter/material.dart';

class AdminReport extends StatefulWidget {
  const AdminReport({Key? key}) : super(key: key);

  @override
  _AdminReportState createState() => _AdminReportState();
}

class _AdminReportState extends State<AdminReport> {
  Widget build(BuildContext context) {
    String programdropdownValue = programmes[0];
    String subjectdropdownValue = courses[0];
    String schooldropdownValue = school[0];
    String semdropdownValue = semesters[0];
    String yeardropdownValue = collegeYear[0];

    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: new ListView(physics: BouncingScrollPhysics(), children: [
          Center(
            child: Image.asset('assets/Logo_Login_Page.png'),
          ),
          //   const SizedBox(
          //   height: 30,
          // ),
          // Center(child: Text("Attendence Management System",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.grey),)),
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Dropdown(
                    dropdownValue: programdropdownValue,
                    values: programmes,
                    hint: "Program"),
                SizedBox(
                  height: 20,
                ),
                Dropdown(
                    dropdownValue: schooldropdownValue,
                    values: school,
                    hint: "School"),
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
                Dropdown(
                    dropdownValue: semdropdownValue,
                    values: semesters,
                    hint: "Semester"),
                SizedBox(
                  height: 20,
                ),
                Dropdown(
                    dropdownValue: subjectdropdownValue,
                    values: courses,
                    hint: "Subject"),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ReportPdfDownloadPage()),
                    );
                  },
                  child: Text("Genrate Report"),
                  style: ElevatedButton.styleFrom(fixedSize: Size(300, 40)),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
