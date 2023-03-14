class Employee {
  const Employee({
    required this.surname,
    required this.name,
    required this.direction,
    required this.commencementDate,
    required this.earnedSalary,
  });

  final String surname;
  final String name;
  final String direction;
  final DateTime commencementDate;
  final int earnedSalary;
}
