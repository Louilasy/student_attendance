import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_attendance/pages/attendancePages/attendancedropdown1.dart';
import 'package:student_attendance/pages/bottomNavBar.dart';
import 'package:student_attendance/pages/loginpages/forgetpass.dart';
import 'package:flutter/material.dart';
import 'package:student_attendance/pages/loginpages/registrationPage.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  String email = '';
  String password = '';
  bool isLoading = false;

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
                  height: 100.0,
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
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(13),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 400,
                  width: 380,
                  decoration: BoxDecoration(
                      //border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade50,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            color: Colors.grey.shade400),
                        //Offset: Offset(0, 2),
                      ]),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      const Text(
                        'Sign In',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Color.fromARGB(255, 6, 0, 79),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Email ID',
                          hintText: 'Enter your Email ID',
                        ),
                        onChanged: (newValue) {
                          email = newValue;
                        },
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
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ForgetPass()),
                            );
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(130, 6, 0, 79)),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPage()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(130, 6, 0, 79)),
                          )),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            UserCredential credential;
                            try {
                              credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LoginNavScreen()),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                log('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                log('Wrong password provided for that user.');
                              }
                            } catch (e) {
                              log(e.toString());
                            }

                            setState(() {
                              isLoading = true;
                            });
                          },
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15),
                            ),
                            primary: (Color.fromRGBO(6, 0, 79, 1)),
                            fixedSize: Size(300, 60),
                          ),
                        ),
                      ),
                    ],
                  ),
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
