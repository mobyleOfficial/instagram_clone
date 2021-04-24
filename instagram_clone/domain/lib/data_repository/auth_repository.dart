abstract class AuthRepository {
  Future<String> signIn(String username, String password);
}