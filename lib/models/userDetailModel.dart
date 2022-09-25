import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Department {
  final String imagePath;
  final String departmentId;
  final String departmentName;
  final String email;
  final String phoneNo;
  //final NumberInputElement phoneNo;
  final String course;

  bool isActive;

  Department({
    required this.imagePath,
    required this.departmentName,
    required this.departmentId,
    required this.email,
    required this.phoneNo,
    required this.course,
    this.isActive = true,
  });
}

enum UserRole {
  Admin,
  Student,
}

class UniUser {
  final String userId;
  final String username;
  final String email;
  final String programme;
  final UserRole userRole;
  bool isActive;
  UniUser({
    required this.userId,
    required this.username,
    required this.email,
    required this.programme,
    required this.userRole,
    this.isActive = true,
  });

  UniUser.fromJson(Map<String, Object?> json)
      : this(
          userId: json['userId']! as String,
          username: json['username']! as String,
          email: json['email']! as String,
          programme: json['programme']! as String,
          isActive: json['isActive']! as bool,
          userRole:
              (json['isAdmin']! as bool) ? UserRole.Admin : UserRole.Student,
        );
  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'programme': programme,
      'isActive': isActive,
      'userRole': (userRole == UserRole.Admin),
    };
  }
}

class Attendance {
  final String userId;
  final String year;
  final DateTime createdAt;
  final String semester;
  final String course;
  bool isActive;
  Attendance({
    required this.userId,
    required this.year,
    required this.createdAt,
    required this.semester,
    required this.course,
    this.isActive = true,
  });

  Attendance.fromJson(Map<String, Object?> json)
      : this(
          userId: json['userId']! as String,
          year: json['year']! as String,
          createdAt: DateTime.parse(json['createdAt']! as String),
          semester: json['semester']! as String,
          course: json['course']! as String,
          isActive: json['isActive']! as bool,
        );

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'year': year,
      'createdAt': createdAt.toIso8601String(),
      'course': course,
      'semester': semester,
      'isActive': isActive,
    };
  }
}
