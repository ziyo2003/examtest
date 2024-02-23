import 'package:examtest/core/either/either.dart';
import 'package:examtest/core/exseption/exseption.dart';
import 'package:examtest/core/failure/failure.dart';
import 'package:examtest/features/authenfication/data/data_sourse/data_sourse.dart';
import 'package:examtest/features/authenfication/data/models/auth_model.dart';
import 'package:examtest/features/authenfication/domain/entities/auth_entities.dart';
import 'package:examtest/features/authenfication/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSourse _dataSource;
  AuthRepositoryImpl({required AuthDataSourse dataSourse})
      : _dataSource = dataSourse;
  @override
  Future<Either<Failure, AuthEntities>> getUser() async {
    try {
      final user = await _dataSource.getUser();
      return Right(
        AuthModel.BazaQullanuvchilar(user),
      );
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          message: "$error",
          code: 404,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthEntities>> login(
      String email, String password) async {
    try {
      final user = await _dataSource.login(email, password);
      return Right(
        AuthModel.BazaQullanuvchilar(user),
      );
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          message: "$error",
          code: 404,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthEntities>> signUp(
      String email, String password) async {
    try {
      final user = await _dataSource.signUp(email, password);
      return Right(
        AuthModel.BazaQullanuvchilar(user),
      );
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          message: "$error",
          code: 404,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final response = await _dataSource.logOut();
      return Right(response);
    } on ServerException catch (error) {
      return Left(
        ServerFailure(
          message: error.message,
          code: error.code,
        ),
      );
    }
  }
}
