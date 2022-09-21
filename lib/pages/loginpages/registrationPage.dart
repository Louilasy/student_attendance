import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_attendance/model/userDetailModel.dart';
import 'package:student_attendance/utils/names.dart';
import 'package:student_attendance/widgets/dropDownWidget.dart';

// ignore: must_be_immutable
class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isObscure = true;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // height: 250,
                  // width: 300,
                  child: Image.asset('assets/Logo_Login_Page.png'),
                  height: 150.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'KWAME NKRUMAH UNIVERSITY OF SCIENCE AND TECHNOLOGY',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    const Text(
                      'Sign Up',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 6, 0, 79),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    TextField(
                      onChanged: (newValue) {
                        email = newValue;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Email ID',
                          hintText: 'Enter your Email ID'),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    TextField(
                      onChanged: (newValue) {
                        password = newValue;
                      },
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Password',
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off_sharp
                              : Icons.visibility_sharp),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 14)),
                    Dropdown(
                      dropdownValue: programdropdownValue,
                      hint: "Program",
                      values: programmes,
                    ),
                    Dropdown(
                        dropdownValue: yeardropdownValue,
                        values: collegeYear,
                        hint: "Year"),
                    Dropdown(
                        dropdownValue: semesterdropdownValue,
                        values: semesters,
                        hint: "Semester"),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //       builder: (context) => LoginNavScreen()),
                          // );
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            DocumentReference<UniUser> newUserDetailsRef =
                                await createUserDetails(credential.user!);

                            if (newUserDetailsRef == Null) {
                              log('User detail creation successful.');
                            } else {
                              log('User detail creation failed.');
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15),
                          ),
                          primary: (Color.fromARGB(255, 0, 79, 32)),
                          fixedSize: Size(300, 60),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //void setState(Null Function() param0) {}
}

Future<DocumentReference<UniUser>> createUserDetails(User user) {
  var newUser = UniUser(
    userId: user.uid,
    username: user.uid,
    email: user.email!,
    semester: semesterdropdownValue,
    year: yeardropdownValue,
    programme: programdropdownValue,
    userRole: UserRole.Student,
  );
  log(newUser.userId);
  log(jsonEncode(newUser.toJson()));

  final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<UniUser>(
            fromFirestore: (snapshot, _) => UniUser.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
  return usersRef.add(newUser);
}
