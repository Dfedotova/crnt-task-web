class Skill {
  Skill({
    required this.skill,
    required this.isPicked,
  });

  final String skill;
  late bool isPicked;

  void updatePickState(bool isPicked){
    this.isPicked = isPicked;
  }
}
