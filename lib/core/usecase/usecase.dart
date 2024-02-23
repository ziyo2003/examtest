import 'package:examtest/core/either/either.dart';
import 'package:examtest/core/failure/failure.dart';



abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params param);
}

class NoParams {}