import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/failures.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/services/api_auth_service.dart';
import 'package:happy_tech_mastering_api_with_flutter/data/models/user_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/domain/entity/user_entity.dart';
import 'package:happy_tech_mastering_api_with_flutter/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiAuthService apiAuthService;

  AuthRepoImpl({required this.apiAuthService});
  @override
  Future<Either<Failure, UserEntity>> loginUserWithEmailAndPassword(
      {required String userEmail, required String userPassowrd}) async{
         try {
      var user = await apiAuthService.signInWithEmailAndPassword(
          email: userEmail, password: userPassowrd);
          // var userEntity = UserEntity(userEmail: userEmail, userName: '', userPassowrd: userPassowrd, userPhone: '', userToken: user["token"]);
          log(user["token"]);

      return right(UserModel.fromJson(user));
    }  catch (e) {
      if (e is DioException) {
         return left(ServerFailuer.fromDioExeption(e));
      }
      return left(ServerFailuer(e.toString()));
    }
    
  }
}
