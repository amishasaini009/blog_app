import 'package:blog_app/core/Error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  
    Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams{}