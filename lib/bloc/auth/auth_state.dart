part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final dynamic customer;
  const AuthState({this.customer});

  @override
  List<Object?> get props => [customer];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  @override
  // ignore: overridden_fields
  final dynamic customer;
  const AuthSuccess({required this.customer});
}

class AuthError extends AuthState {
  final String error;
  const AuthError({required this.error});
}

class PhoneAuthCodeSentSuccess extends AuthState {
  final String verificationId;
  const PhoneAuthCodeSentSuccess({required this.verificationId});
}
