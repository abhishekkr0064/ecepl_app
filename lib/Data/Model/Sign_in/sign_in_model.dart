class SignInModel {
  final String projectKey;
  final String email;
  final String password;

  SignInModel({
    required this.projectKey,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
    "project": projectKey,
    "email": email,
    "password": password,
  };
}
