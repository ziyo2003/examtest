// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthEvent {}

class AuthBlocStarted extends AuthEvent {}

class LogOutButtonPressed extends AuthEvent {
  final VoidCallback succsess;
  LogOutButtonPressed({
    required this.succsess,
  });
}
class LoginButtonPressed extends AuthEvent {
  final String email; 
  final String password; 
  final VoidCallback failure;
  final VoidCallback succsess;
  LoginButtonPressed({
    required this.email,
    required this.password,
    required this.failure,
    required this.succsess,
  });
  
}

class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final VoidCallback onSuccsess;
  final VoidCallback failure;
  AuthSignUp({
    required this.email,
    required this.password,
    required this.onSuccsess,
    required this.failure,
  });
}
