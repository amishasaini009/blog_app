import 'package:blog_app/core/Error/failures.dart';
import 'package:blog_app/core/common/entites/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository{
    Future<Either<Failure,User>> signUpWithEmailPassword({
      required String name,
      required String email,
      required String password,
    });

     Future<Either<Failure,User>> logInWithEmailPassword({
      required String email,
      required String password,
    });
    
    Future<Either<Failure, User>> currentUser();

}