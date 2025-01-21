class ProfileModel {
  final String name, role, pin;
  final int salary;

  ProfileModel({
    required this.name,
    required this.role,
    required this.pin,
    required this.salary,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'],
      role: map['role'],
      pin: map['pin'],
      salary: map['salary'],
    );
  }
}
