import 'package:firebase_auth/firebase_auth.dart';

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

class UniUser {
  final String userId;
  final String username;
  final String email;
  final String semester;
  final String programme;
  final String year;
  final UserRole userRole;
  bool isActive;
  UniUser({
    required this.userId,
    required this.username,
    required this.email,
    required this.semester,
    required this.year,
    required this.programme,
    required this.userRole,
    this.isActive = true,
  });

  UniUser.fromJson(Map<String, Object?> json)
      : this(
          userId: json['userId']! as String,
          username: json['username']! as String,
          email: json['email']! as String,
          semester: json['semester']! as String,
          year: json['year']! as String,
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
      'semester': semester,
      'year': year,
      'programme': programme,
      'isActive': isActive,
      'userRole': (userRole == UserRole.Admin),
    };
  }
}

enum UserRole {
  Admin,
  Student,
}
