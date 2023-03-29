// import 'package:freezed_annotation/freezed_annotation.dart';
//
// @freezed
// class User with _$User {
//   factory User({
//     required String fullName,
//     required String email,
//     required String phone,
//     required String telegram,
//   }) = _User;
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }
//
// @freezed
// class Task with _$Task {
//   factory Task({
//     required String id, // id = id_проекта-порядковый номер
//     required Project project, // мб через привязку к проекту лучше, если привязать, можно будет как раз считать кол-во согласованных тасок в проекте
//     required String name,
//     required String type,
//     required DateTime deadlineDate,
//     required DateTime deadlineTime,
//     required int priority, // values: [1..4]
//     required List<String> tags,
//     required String responsible,
//   }) = _Task;
//
//   factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
// }
//
// @freezed
// class Skill with _$Skill {
//   factory Skill({
//     required String skill,
//     required bool isPicked,
//   }) = _Skill;
//
//   factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
// }
// @freezed
// class Project with _$Project {
//   factory Project({
//     required String name,
//     required String id,
//     required String direction,
//     required String description,
//     required String responsible,
//   }) = _Project;
//
//   factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);
// }
// @freezed
// class Employee with _$Employee {
//   factory Employee({
//     required String surname,
//     required String name,
//     required String email,
//     required String phone,
//     required String telegram,
//     required String direction,
//     required DateTime commencementDate;
//     required int earnedSalary;
//
//   }) = _Employee;
//
//   factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
// }
