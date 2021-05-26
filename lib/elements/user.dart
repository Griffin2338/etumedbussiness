class EtuPerson {
  EtuPerson(
      {required this.first_name,
      required this.last_name,
      required this.email,
      required this.password,
      required this.department,
      required this.graduation_date,
      required this.is_admin});

  EtuPerson.fromJson(Map<String, Object?> json)
      : this(
          first_name: json['first_name']! as String,
          last_name: json['last_name']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
          department: json['department']! as String,
          graduation_date: json['graduation_date']! as String,
          is_admin: json['is_admin']! as bool,
        );

  final String first_name;
  final String last_name;
  final String password;
  final String email;
  final String department;
  final String graduation_date;
  final bool is_admin;

  Map<String, Object?> toJson() {
    return {
      'first_name': first_name, // John Doe
      'last_name': last_name, // Stokes and Sons
      'email': email,
      'password': password,
      'department': department,
      'graduation_date': graduation_date,
      'is_admin': is_admin,
    };
  }
}
