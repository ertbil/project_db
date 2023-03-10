class Login {
  String? mail;
  String? password;

  Login({
    this.mail,
    this.password,
  });

  Login.fromJson(Map<String, dynamic> json)
      : mail = json["email"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        "email": mail,
        "password": password,
      };
}
