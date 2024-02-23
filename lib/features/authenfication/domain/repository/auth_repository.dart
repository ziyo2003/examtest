import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../entities/auth_entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntities>> getUser();
  Future<Either<Failure, AuthEntities>> login(String email, String password);
  Future<Either<Failure, AuthEntities>> signUp(String email, String password);
  Future<Either<Failure, void>> logOut();
}
