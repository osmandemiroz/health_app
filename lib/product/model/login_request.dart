final class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
    required this.userType,
    required this.additionalFields,
  });
  final String email;
  final String password;
  final String userType;
  final Map<String, String> additionalFields;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'userType': userType,
      'additionalFields': additionalFields,
    };
  }
}
