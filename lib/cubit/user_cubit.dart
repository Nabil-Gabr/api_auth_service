import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/domain/repo/auth_repo.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.authRepo) : super(UserInitial());
  final AuthRepo authRepo;
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  Future<void> signIn() async {
    //1-emit SignInLoading
    emit(SignInLoading());

    //result<Ether< L , R >>
    var result = await authRepo.loginUserWithEmailAndPassword(
        userEmail: signInEmail.text, userPassowrd: signInPassword.text,);

    //result fold
    result.fold(
      //2-emit SignInFailure
      (failuer) => emit(SignInFailutr(errorMessage: failuer.errMessag)),
      //3-emit SignInSuccess
      (userEntity) => emit(SignInSuccess()),
    );
    // try {
    //   emit(SignInLoading());
    //   final response = await Dio().post("http://10.0.2.2:3000/api/auth/login",
    //       data: {
    //         "email": signInEmail.text,
    //         "password": signInPassword.text,
    //       });
    //   emit(SignInSuccess());
    //   print(response);
    // } catch (e) {
    //   emit(SignInFailutr(errorMessage: e.toString()));
    //   print(e.toString());
    // }
  }
}
