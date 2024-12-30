abstract class Role {
  void displayRole();
}
class Student implements Role {
  String? name;
  int? studentId;
  Student(this.name, this.studentId);
  @override
  void displayRole() {
    print("Role: Student");
    print("Name: $name");
    print("Student ID: $studentId");
  }

  void attendClass() {
    print("$name is attending class.");
  }

  void submitAssignment() {
    print("$name submitted an assignment.");
  }
}

class Teacher implements Role {
  String? name;
  String? subject;
  Teacher(this.name, this.subject);
  @override
  void displayRole() {
    print("Role: Teacher");
    print("Name: $name");
    print("Subject: $subject");
  }

  void conductClass() {
    print("$name is conducting a class on $subject.");
  }

  void gradeAssignment() {
    print("$name is grading assignments for $subject.");
  }
}

void main() {
  Student student1 = Student("Alice Johnson", 12345);
  Teacher teacher1 = Teacher("Dr. Smith", "Mathematics");

  List<Role> users = [student1, teacher1];

  for (var user in users) {
    user.displayRole();
    print("------");
  }

  student1.attendClass();
  student1.submitAssignment();

  teacher1.conductClass();
  teacher1.gradeAssignment();


}