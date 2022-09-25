import 'package:student_attendance/widgets/dropDownWidget.dart';
import 'package:student_attendance/pages/reportpages/reportPdfDownload.dart';
import 'package:student_attendance/utils/names.dart';
import 'package:flutter/material.dart';

class ReportGeneration extends StatefulWidget {
  const ReportGeneration({Key? key}) : super(key: key);

  @override
  _ReportGenerationState createState() => _ReportGenerationState();
}

class _ReportGenerationState extends State<ReportGeneration> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    DateTime selectedDate2 = DateTime.now();

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

    Future<void> _selectDate2(BuildContext context) async {
      final DateTime? picked2 = await showDatePicker(
          context: context,
          initialDate: selectedDate2,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked2 != null && picked2 != selectedDate2)
        setState(() {
          selectedDate2 = picked2;
        });
    }

    // String yeardropdownValue = CollegeYear[0];
    // String batchdropdownValue = Batch[0];
    // String subjectdropdownValue = Subject[0];
    // String facultiesdropdownValue = Faculties[0];
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: 20),
            Dropdown(
                dropdownValue: yeardropdownValue,
                values: collegeYear,
                hint: "Year"),
            // SizedBox(height: 20),
            Dropdown(
                dropdownValue: semesterdropdownValue,
                values: semesters,
                hint: "Semester"),
            // SizedBox(height: 20),

            // SizedBox(height: 20),
            Dropdown(
                dropdownValue: courseDropdownValue,
                values: courses,
                hint: "Subject"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("From :"),
                    SizedBox(height: 5.0),
                    Text("${selectedDate.toLocal()}".split(' ')[0]),
                    SizedBox(height: 10.0),
                    MaterialButton(
                      color: Colors.red,
                      onPressed: () => _selectDate(context),
                      child: Text(
                        'Select date',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("To :"),
                    SizedBox(height: 5.0),
                    Text("${selectedDate2.toLocal()}".split(' ')[0]),
                    SizedBox(height: 10.0),
                    MaterialButton(
                      color: Colors.red,
                      onPressed: () => _selectDate2(context),
                      child: Text(
                        'Select date',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ReportPdfDownloadPage()),
                );
              },
              child: Text("Generate Report"),
              style: ElevatedButton.styleFrom(fixedSize: Size(300, 40)),
            ),
          ],
        ),
      ),
    );
  }
}
