// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState {
  final Status status; 
  final AuthEntities user; 
  AuthState({
    required this.status,
    required this.user,
  });

  AuthState copyWith({
    Status? status,
    AuthEntities? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  String toString() => 'AuthState(status: $status, user: $user)';

  @override
  bool operator ==(covariant AuthState other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.user == user;
  }

  @override
  int get hashCode => status.hashCode ^ user.hashCode;
 }

