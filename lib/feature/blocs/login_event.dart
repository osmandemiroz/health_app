import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({
    required this.email,
    required this.password,
    required this.userType,
    required this.additionalFields,
  });
  final String email;
  final String password;
  final String userType;
  final Map<String, String> additionalFields;

  @override
  List<Object?> get props => [email, password, userType, additionalFields];
}
