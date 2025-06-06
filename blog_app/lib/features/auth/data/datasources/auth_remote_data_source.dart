import 'package:blog_app/core/Error/exceptions.dart';
import 'package:blog_app/core/common/entites/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
   Session? get currentUserSession;

  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  });


  Future<UserModel?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);



@override
  // TODO: implement currentUserSession
  Session? get currentUserSession => supabaseClient.auth.currentSession;


  @override
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  }) async{
    try {
     final response = await  supabaseClient.auth.signInWithPassword(
        password: password,
        email: email
      );
      
      if(response.user == null){
           throw const ServerException("User is null!");
      }

      return UserModel.fromJson(response.user!.toJson()) ;
    } catch (e) {

         throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
     final response = await  supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );
      
      if(response.user == null){
           throw const ServerException("User is null!");
      }

      return UserModel.fromJson(response.user!.toJson()) ;
    } catch (e) {

         throw ServerException(e.toString());
    }
  }
  
  @override
  Future<UserModel?> getCurrentUserData() async{
     try {
       final userData = await supabaseClient.from('profiles').select().eq('id', currentUserSession!.user.id);

       return UserModel.fromJson(userData.first);
     }catch (e) {
       ServerException(e.toString());
     }
  }
  
  
}
