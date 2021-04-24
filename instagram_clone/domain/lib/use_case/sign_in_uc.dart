import 'dart:async';

import 'package:domain/data_repository/auth_repository.dart';
import 'package:domain/use_case/use_case.dart';

class SignInUC extends UseCase<SignInUCParams, String> {
  SignInUC(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<String> getRawFuture(SignInUCParams params) => _authRepository.signIn(
        params.username,
        params.password,
      );
}

class SignInUCParams {
  const SignInUCParams(
    this.username,
    this.password,
  );

  final String username;
  final String password;
}
