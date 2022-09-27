import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_attendance/models/userDetailModel.dart';

class ShowAttendance extends StatelessWidget {
  final String userId;

  ShowAttendance(this.userId);

  @override
  Widget build(BuildContext context) {
    Query<Attendance> attendance = FirebaseFirestore.instance
        .collection('attendance')
        .withConverter<Attendance>(
          fromFirestore: (snapshot, _) => Attendance.fromJson(snapshot.data()!),
          toFirestore: (attendance, _) => attendance.toJson(),
        )
        .where('userId', isEqualTo: userId);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Attendance Data'),
      ),
      body: FutureBuilder<QuerySnapshot<Attendance>>(
        future: attendance.get(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Attendance>> snapshot) {
          List<Widget> columnChildren = [
            Text("loading"),
            CircularProgressIndicator(value: 30.0),
          ];
          if (snapshot.hasError) {
            columnChildren = [
              Text("Something went wrong"),
              Icon(
                Icons.error,
                color: Colors.red,
              ),
            ];
          }

          if (snapshot.hasData && snapshot.data!.size == 0) {
            columnChildren = [
              Text("No Data Found"),
              Icon(
                Icons.dangerous,
                color: Colors.red,
              ),
            ];
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<QueryDocumentSnapshot<Attendance>> data = snapshot.data!.docs;
            List<Attendance> myList = [];
            data.forEach((element) {
              myList.add(element.data());
            });
            columnChildren = [
              Expanded(
                child: ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: myList.length,
                    itemBuilder: (context, index) {
                      var year = myList[index].year;
                      var semester = myList[index].semester;
                      var course = myList[index].course;
                      return Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Card(
                          child: ListTile(
                            leading: Text('SEM $semester:'),
                            title: Text(myList[index].createdAt.toString()),
                            subtitle: Text(course),
                            trailing: Text(' - YEAR $year'),
                          ),
                        ),
                      );
                    }),
              ),
            ];
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: columnChildren,
          );
        },
      ),
    );
  }
}
