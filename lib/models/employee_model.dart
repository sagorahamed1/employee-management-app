

class EmployeeModel {
  final String? createdAt;
  final String? name;
  final String? avatar;
  final String? designation;
  final String? age;
  final String? id;

  EmployeeModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.designation,
    this.age,
    this.id,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    createdAt: json["createdAt"],
    name: json["name"],
    avatar: json["avatar"],
    designation: json["designation"],
    age: json["age"],
    id: json["id"],
  );

}
