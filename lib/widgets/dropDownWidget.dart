import 'package:student_attendance/utils/names.dart';
import 'package:flutter/material.dart';

Widget dropdownButton(
  String? dropdownValue,
  List<String> string,
  String hint,
) {
  void ChangeState() {
    switch (hint) {
      case "Program":
        programdropdownValue = dropdownValue!;
        break;
      case "School":
        schooldropdownValue = dropdownValue!;
        break;

      case "Year":
        yeardropdownValue = dropdownValue!;
        break;
      case "Semester":
        semesterdropdownValue = dropdownValue!;
        break;

      case "Subject":
        subjectdropdownValue = dropdownValue!;
        break;
      default:
    }
  }

  return Container(
    child: Column(
      children: [
        Text(
          hint,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 0.80),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
              ]),
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(
              hint,
              style: TextStyle(color: Colors.black),
            ),
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            elevation: 16,
            dropdownColor: Colors.grey[100],
            style: const TextStyle(color: Colors.black),
            underline: Container(height: 0, color: Colors.black),
            onChanged: (String? newval) {
              // setState((){
              dropdownValue = newval!;
              ChangeState();
              // });
            },
            items: string.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}

class Dropdown extends StatefulWidget {
  final String dropdownValue;
  final List<String> values;
  final String hint;
  Dropdown({
    Key? key,
    required this.dropdownValue,
    required this.values,
    required this.hint,
  }) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String dropdownValue;
  late List<String> string;
  late String hint;
  void ChangeState() {
    switch (hint) {
      case "Program":
        programdropdownValue = dropdownValue;
        break;
      case "School":
        schooldropdownValue = dropdownValue;
        break;
      case "Year":
        yeardropdownValue = dropdownValue;
        break;
      case "Semester":
        semesterdropdownValue = dropdownValue;
        break;

      case "Subject":
        subjectdropdownValue = dropdownValue;
        break;

      default:
    }
  }

  void initState() {
    super.initState();
    dropdownValue = widget.dropdownValue;
    string = widget.values;
    hint = widget.hint;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          Text(hint, style: TextStyle(fontSize: 20)),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                ]),
            child: DropdownButton<String>(
              isExpanded: true,
              // hint: Text(hint,style: TextStyle(color: Colors.black),),
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              elevation: 16,
              dropdownColor: Colors.grey[100],
              style: const TextStyle(color: Colors.black),
              underline: Container(height: 0, color: Colors.black),
              onChanged: (String? newval) {
                setState(() {
                  dropdownValue = newval!;
                  ChangeState();
                });
              },

              items: string.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
