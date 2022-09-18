import 'package:student_attendance/model/userDetailModel.dart';
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
      departmentName: Faculties[2],
      email: FacultiesEmailID[0],
      phoneNo: PhoneNo[0],
      departmentId: FacultiesID[0],
      course: Subject[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: Faculties[2],
      email: FacultiesEmailID[0],
      phoneNo: PhoneNo[0],
      departmentId: FacultiesID[0],
      course: Subject[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: Faculties[2],
      email: FacultiesEmailID[0],
      phoneNo: PhoneNo[0],
      departmentId: FacultiesID[0],
      course: Subject[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: Faculties[2],
      email: FacultiesEmailID[0],
      phoneNo: PhoneNo[0],
      departmentId: FacultiesID[0],
      course: Subject[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: Faculties[2],
      email: FacultiesEmailID[0],
      phoneNo: PhoneNo[0],
      departmentId: FacultiesID[0],
      course: Subject[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: Faculties[2],
      email: FacultiesEmailID[0],
      phoneNo: PhoneNo[0],
      departmentId: FacultiesID[0],
      course: Subject[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: Faculties[2],
      email: FacultiesEmailID[0],
      phoneNo: PhoneNo[0],
      departmentId: FacultiesID[0],
      course: Subject[0],
    ),
    Department(
      imagePath: "https://miro.medium.com/max/1400/0*qfJWOn_IjKoc305B.jpg"
      // "https://source.unsplash.com/featured/?profile"
      ,
      departmentName: Faculties[2],
      email: FacultiesEmailID[0],
      phoneNo: PhoneNo[0],
      departmentId: FacultiesID[0],
      course: Subject[0],
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
  static var student = User(
    userId: "2019btcs002",
    username: "Abhinay",
    email: "2019btcs002@@Student.com",
    semester: "V",
    year: "3rd",
    programme: "Btech",
    userRole: UserRole.Student,
  );
  static List<User> studentlist = [
    User(
      userId: "2019btcs002",
      username: "Abhinay",
      email: "2019btcs002@@Student.com",
      semester: "V",
      year: "3rd",
      programme: "Btech",
      userRole: UserRole.Student,
    ),
    User(
        userId: Enrollment[0],
        username: Students[0],
        email: StudentEmail[0],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[1],
        username: Students[1],
        email: StudentEmail[1],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[2],
        username: Students[2],
        email: StudentEmail[2],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[3],
        username: Students[3],
        email: StudentEmail[3],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[4],
        username: Students[4],
        email: StudentEmail[4],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[5],
        username: Students[5],
        email: StudentEmail[5],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[6],
        username: Students[6],
        email: StudentEmail[6],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[7],
        username: Students[7],
        email: StudentEmail[7],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[8],
        username: Students[8],
        email: StudentEmail[8],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
    User(
        userId: Enrollment[9],
        username: Students[9],
        email: StudentEmail[9],
        semester: Semester[4],
        year: CollegeYear[0],
        programme: Program[0],
        userRole: UserRole.Student),
  ];
}
