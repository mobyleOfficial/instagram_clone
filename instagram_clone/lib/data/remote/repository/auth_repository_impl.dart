import 'package:domain/data_repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<void> signIn(String username, String password) =>
      Future.value(null);
}
