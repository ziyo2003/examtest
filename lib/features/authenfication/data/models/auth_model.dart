import 'package:examtest/features/authenfication/domain/entities/auth_entities.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel extends AuthEntities {
  AuthModel({required super.email});

  factory AuthModel.BazaQullanuvchilar(User user) {
    return AuthModel(email: user.email ??'');
  }
}
