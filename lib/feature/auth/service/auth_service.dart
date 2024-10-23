import 'package:health_app/product/model/login_request.dart';

class LoginService {
  Future<bool> login(LoginRequest request) async {
    // TODO: Implement actual API call
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
