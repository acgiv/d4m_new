part of 'account_cubit.dart';

abstract class AccountState {}

class AuthInitial extends AccountState {}

class AuthLoading extends AccountState {}

class AuthSuccess extends AccountState {
  final String token;

  AuthSuccess(this.token);
}

class AuthError extends AccountState {
  final String error;

  AuthError(this.error);
}
