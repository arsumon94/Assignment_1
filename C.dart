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

void main() {
  Student student1 = Student(
    name: "Alice Johnson",
    age: 20,
    address: "123 Main St",
    studentID: 12345,
    grade: "A",
    courseScores: [90.5, 85.0, 92.3, 78.8],
  );

  student1.displayRole();
  print("Average Score: ${student1.calculateAverageScore()}");

  Student student2 = Student(
    name: "Bob Williams",
    age: 21,
    address: "456 Oak Ave",
    studentID: 67890,
    grade: "B",

  );

  student2.displayRole();
  print("Average Score: ${student2.calculateAverageScore()}");
}