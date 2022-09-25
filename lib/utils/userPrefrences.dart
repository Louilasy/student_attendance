import 'package:student_attendance/models/userDetailModel.dart';
import 'package:student_attendance/utils/names.dart';

class UserPrefrences {
  static List<Department> FacultyList = [
    Department(
      imagePath:
          "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png"
      // "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      //"https://source.unsplash.com/featured/?profile"
      ,
      departmentName: "Faculty Name",
      email: "faculty.email@suas.ac.in",
      phoneNo: '9876987697',
      departmentId: "123",
      course: "Subject Name",
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: faculties[2],
      email: facultiesEmailID[0],
      phoneNo: phoneNo[0],
      departmentId: facultiesID[0],
      course: courses[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: faculties[2],
      email: facultiesEmailID[0],
      phoneNo: phoneNo[0],
      departmentId: facultiesID[0],
      course: courses[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: faculties[2],
      email: facultiesEmailID[0],
      phoneNo: phoneNo[0],
      departmentId: facultiesID[0],
      course: courses[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: faculties[2],
      email: facultiesEmailID[0],
      phoneNo: phoneNo[0],
      departmentId: facultiesID[0],
      course: courses[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: faculties[2],
      email: facultiesEmailID[0],
      phoneNo: phoneNo[0],
      departmentId: facultiesID[0],
      course: courses[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: faculties[2],
      email: facultiesEmailID[0],
      phoneNo: phoneNo[0],
      departmentId: facultiesID[0],
      course: courses[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: faculties[2],
      email: facultiesEmailID[0],
      phoneNo: phoneNo[0],
      departmentId: facultiesID[0],
      course: courses[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: faculties[2],
      email: facultiesEmailID[0],
      phoneNo: phoneNo[0],
      departmentId: facultiesID[0],
      course: courses[0],
    ),
  ];

  // UserPrefrences(){

  // for (int i=0 ; i<Faculties.length;i++) {

  // sample = Faculty(
  //   imagePath:
  //   "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg",
  //   //"https://source.unsplash.com/featured/?profile",
  //   facultyName: Faculties[2],
  //   email:"faculty.email@suas.ac.in",
  //   phoneNo: '9876987697',
  //   facultyId: "123",
  //   subject: "Subject Name",
  // ) as List<Faculty>;
  // }
  // }
  static var myUser = Department(
    imagePath: "https://www.pavilionweb.com/wp-content/uploads/2017/03/man.png"
    // "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
    //"https://source.unsplash.com/featured/?profile"
    ,
    departmentName: "Faculty Name",
    email: "faculty.email@suas.ac.in",
    phoneNo: '9876987697',
    departmentId: "123",
    course: "Subject Name",
  );
  static var student = UniUser(
    userId: "2019btcs002",
    username: "Abhinay",
    email: "2019btcs002@@Student.com",
    programme: "Btech",
    userRole: UserRole.Student,
  );
  static List<UniUser> studentlist = [
    UniUser(
      userId: "2019btcs002",
      username: "Abhinay",
      email: "2019btcs002@@Student.com",
      programme: "Btech",
      userRole: UserRole.Student,
    ),
    UniUser(
        userId: enrollment[0],
        username: students[0],
        email: studentEmail[0],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[1],
        username: students[1],
        email: studentEmail[1],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[2],
        username: students[2],
        email: studentEmail[2],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[3],
        username: students[3],
        email: studentEmail[3],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[4],
        username: students[4],
        email: studentEmail[4],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[5],
        username: students[5],
        email: studentEmail[5],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[6],
        username: students[6],
        email: studentEmail[6],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[7],
        username: students[7],
        email: studentEmail[7],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[8],
        username: students[8],
        email: studentEmail[8],
        programme: programmes[0],
        userRole: UserRole.Student),
    UniUser(
        userId: enrollment[9],
        username: students[9],
        email: studentEmail[9],
        programme: programmes[0],
        userRole: UserRole.Student),
  ];
}
