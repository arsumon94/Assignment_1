abstract class Role {
  void displayRole();
}

class StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

class Person implements Role {
  String name;
  int age;
  String address;
  Role? role;

  Person({required this.name, required this.age, required this.address, this.role});

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;
  Role? get getRole => role;

  @override
  void displayRole() {
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    if (role != null) {
      role!.displayRole();
    } else {
      print("No role assigned.");
    }
  }
}

class Student extends Person {
  int studentID;
  String grade;
  List<double> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    this.courseScores = const [],
  }) : super(name: name, age: age, address: address, role: StudentRole());

  @override
  void displayRole() {
    super.displayRole();
    print("Student ID: $studentID");
    print("Grade: $grade");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    double sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }
}

class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    this.coursesTaught = const [],
  }) : super(name: name, age: age, address: address, role: TeacherRole());

  @override
  void displayRole() {
    super.displayRole();
    print("Teacher ID: $teacherID");
  }

  void displayCoursesTaught() {
    if (coursesTaught.isEmpty) {
      print("No courses assigned to this teacher.");
      return;
    }
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

class StudentManagementSystem {
  static void main() {
    Student student1 = Student(
      name: "Alice Johnson",
      age: 20,
      address: "123 Main St",
      studentID: 12345,
      grade: "A",
      courseScores: [90.5, 85.0, 92.3],
    );

    Student student2 = Student(
      name: "Bob Williams",
      age: 21,
      address: "456 Oak Ave",
      studentID: 67890,
      grade: "B",
    );

    Teacher teacher1 = Teacher(
      name: "Dr. Smith",
      age: 45,
      address: "789 Pine Ln",
      teacherID: 9876,
      coursesTaught: ["Mathematics", "Physics", "Calculus"],
    );

    Teacher teacher2 = Teacher(
      name: "Ms. Doe",
      age: 35,
      address: "101 Elm St",
      teacherID: 5432,
    );

    print("--- Students ---");
    student1.displayRole();
    print("Average Score: ${student1.calculateAverageScore()}");
    print("---");
    student2.displayRole();
    print("Average Score: ${student2.calculateAverageScore()}");


    print("\n--- Teachers ---");
    teacher1.displayRole();
    teacher1.displayCoursesTaught();
    print("---");
    teacher2.displayRole();
    teacher2.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}