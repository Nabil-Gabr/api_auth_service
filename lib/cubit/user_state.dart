class UserState {}

final class UserInitial extends UserState {}

final class SignInSuccess extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailutr extends UserState {
  final String errorMessage;

  SignInFailutr({required this.errorMessage});
}
