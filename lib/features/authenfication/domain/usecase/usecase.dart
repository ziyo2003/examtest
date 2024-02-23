import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_entities.dart';
import '../repository/auth_repository.dart';

class AuthUseCase implements UseCase<AuthEntities, NoParams> {
  final AuthRepository _repository;
  AuthUseCase({
    required AuthRepository repository
  }): _repository = repository;
  
  @override
  Future<Either<Failure, AuthEntities>> call(NoParams param) async {
    if(param is GetUserStatus){
      return await _repository.getUser();
    }else if(param is LoginParams){
      return await _repository.login(param.email, param.password); 
    }else if(param is SignUp){
      return await _repository.signUp(param.email, param.password);
    }else{
      throw UnimplementedError();
    }
  }
}

class GetUserStatus extends NoParams {}

class SignUp extends NoParams {
  final String email;
  final String password;
  SignUp({
    required this.email,
    required this.password,
  });
}

class LoginParams extends NoParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
