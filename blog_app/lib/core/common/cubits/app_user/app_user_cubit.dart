
import 'package:blog_app/core/common/entites/user.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());


  void updateUser (User? user){
      if(user == null){
          emit(AppUserInitial());
      }
      else {
        emit(AppUserLoggedIn(user));
      }
  }
}
