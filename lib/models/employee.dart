class Employee {
  const Employee({
    required this.surname,
    required this.name,
    required this.email,
    required this.phone,
    required this.telegram,
    required this.direction,
    required this.commencementDate,
    required this.earnedSalary,
  });

  final String surname;
  final String name;
  final String email;
  final String phone;
  final String telegram;
  final String direction;
  final DateTime commencementDate;
  final int earnedSalary;

  String get getFullName{
    return '$surname $name';
  }
}
