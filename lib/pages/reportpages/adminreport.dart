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
    String programdropdownValue = Program[0];
    String subjectdropdownValue = Subject[0];
    String batchdropdownValue = Batch[0];
    String schooldropdownValue = School[0];
    String semdropdownValue = Semester[0];
    String yeardropdownValue = CollegeYear[0];

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
                dropdown(
                    dropdownValue: programdropdownValue,
                    sTring: Program,
                    hint: "Program"),
                SizedBox(
                  height: 20,
                ),
                dropdown(
                    dropdownValue: schooldropdownValue,
                    sTring: School,
                    hint: "School"),
                SizedBox(
                  height: 20,
                ),
                dropdown(
                    dropdownValue: yeardropdownValue,
                    sTring: CollegeYear,
                    hint: "Year"),
                SizedBox(
                  height: 20,
                ),
                dropdown(
                    dropdownValue: semdropdownValue,
                    sTring: Semester,
                    hint: "Semester"),
                SizedBox(
                  height: 20,
                ),
                dropdown(
                    dropdownValue: subjectdropdownValue,
                    sTring: Subject,
                    hint: "Subject"),
                SizedBox(
                  height: 20,
                ),
                dropdown(
                    dropdownValue: batchdropdownValue,
                    sTring: Batch,
                    hint: "Batch"),
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
