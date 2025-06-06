import 'package:blog_app/core/Error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entites/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<User, UserLoginParams>{

  final AuthRepository authRepository;

  UserLogin(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.logInWithEmailPassword(email: params.email, password: params.password);
  }


}


class UserLoginParams{

final String email;
final String password;

  UserLoginParams({required this.email, required this.password});

}