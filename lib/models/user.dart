class User {
  String? name, email, gender, profilePic, status, msg;
  dynamic id, phone, details;

  User(
      {this.id,
      this.name,
      this.email,
      this.gender,
      this.phone,
      this.profilePic,
      this.details,
      this.status,
      this.msg});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        details: json["details"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        profilePic: json["imageUrl"],
        gender: json["gender"],
        status: json["status"],
        msg: json["msg"]);
  }
}
