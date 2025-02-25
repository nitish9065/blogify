sealed class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpOtpRequested extends SignUpState {
  final String email;
  final String password;

  SignUpOtpRequested(this.email, this.password);
}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String error;

  SignUpErrorState(this.error);
}
