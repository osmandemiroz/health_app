import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app/feature/blocs/login_event.dart';
import 'package:health_app/feature/blocs/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      // TODO: Implement authentication logic
      await Future.delayed(const Duration(seconds: 2));
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
