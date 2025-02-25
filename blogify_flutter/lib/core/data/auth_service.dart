
abstract class AuthService{

  Future<bool> createAccountRequest({required String email, required String password, required String userName});

  Future<bool> verifyAccount({required String verifcationCode, required String email, required String password});

  Future<bool> logInWithEmailPassword({required String email, required String password});
}