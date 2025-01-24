class ProfileModel {
  final String name, role, pin;
  final int salary, phone;

  ProfileModel({
    required this.name,
    required this.role,
    required this.pin,
    required this.salary,
    required this.phone,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'],
      role: map['role'],
      pin: map['pin'],
      salary: map['salary'],
      phone: map['phone'],
    );
  }
}
