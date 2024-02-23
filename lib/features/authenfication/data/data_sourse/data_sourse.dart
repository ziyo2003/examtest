import 'package:firebase_auth/firebase_auth.dart';
import 'package:examtest/core/exseption/exseption.dart';

abstract class AuthDataSourse {

  Future<User> getUser();

  Future<User> signUp(String email, String password);

  Future<User> login(String email, String password);

  Future<void> logOut();

  factory AuthDataSourse() => _AuthDataSourse();
}

class _AuthDataSourse implements AuthDataSourse {
  @override
  Future<User> getUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        throw ServerException(errorMassege: "the USER doesnt exist", errorCode: "404");
      }
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } on ServerException {
      rethrow;
    } catch (element) {
      throw ServerException(errorMassege: "$element", errorCode: "404");
    }
  }

  @override
  Future<User> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return FirebaseAuth.instance.currentUser!;
    } catch (e) {
      throw ServerException(
        errorMassege: "you can't sign up -> error <-", errorCode: "404",
      );
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw ServerException(
          errorMassege: "you can't LogOut -> error <-", errorCode: "404");
    }
  }
}
