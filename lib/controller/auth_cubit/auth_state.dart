part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailed extends AuthState {
  final String error;

  LoginFailed(this.error);
}

final class OtpCheckLoading extends AuthState {}

final class OtpCheckSuccess extends AuthState {}

final class OtpCheckFailed extends AuthState {
  final String error;

  OtpCheckFailed(this.error);
}

final class CompleteRegisterationLoading extends AuthState {}

final class CompleteRegisterationSuccess extends AuthState {}

final class CompleteRegisterationFailed extends AuthState {
  final String error;

  CompleteRegisterationFailed(this.error);
}

final class LogoutLoading extends AuthState {}

final class LogoutSuccess extends AuthState {}

final class LogoutFailed extends AuthState {
  final String error;

  LogoutFailed(this.error);
}
