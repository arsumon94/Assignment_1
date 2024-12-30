abstract class Role {
  void displayRole();
}
class Student implements Role {
  String name;
  int studentId;
  Student(this.name, this.studentId);
  @override
  void displayRole() {
    print("Role: Student");
    print("Student ID: $studentId");
  }
}

class Teacher implements Role {
  String name;
  String subject;
  Teacher(this.name, this.subject);
  @override
  void displayRole() {
    print("Role: Teacher");
    print("Subject: $subject");
  }
}


class Person implements Role{
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

void main() {

  Student student1Role = Student("Alice's Student Role", 12345);
  Teacher teacher1Role = Teacher("Dr. Smith's Teacher Role", "Mathematics");

  Person person1 = Person(name: "Alice Johnson", age: 20, address: "123 Main St", role: student1Role);
  Person person2 = Person(name: "Dr. Smith", age: 45, address: "456 Oak Ave", role: teacher1Role);
  Person person3 = Person(name: "Bob", age: 30, address: "789 Pine Ln"); // No role

  person1.displayRole();
  print("------");
  person2.displayRole();
  print("------");
  person3.displayRole();
}