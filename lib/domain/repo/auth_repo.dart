import 'package:dartz/dartz.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/error/failures.dart';
import 'package:happy_tech_mastering_api_with_flutter/domain/entity/user_entity.dart';

abstract class AuthRepo {
  
  //login method
  Future<Either<Failure, UserEntity>> loginUserWithEmailAndPassword(
      {required String userEmail, required String userPassowrd});
}
