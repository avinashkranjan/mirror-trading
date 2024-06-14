part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GoogleSignInEvent extends AuthEvent {
  const GoogleSignInEvent();
}

class AppleSignInEvent extends AuthEvent {
  const AppleSignInEvent();
}

class FacebookSignInEvent extends AuthEvent {
  const FacebookSignInEvent();
}

class EmailLoginAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;
  const EmailLoginAuthEvent(
      {required this.password, required this.email, required this.context});
}

class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}

class AuthSuccessEvent extends AuthEvent {
  final dynamic customer;
  const AuthSuccessEvent({required this.customer});
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}
