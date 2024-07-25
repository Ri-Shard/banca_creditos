import 'package:banca_creditos/domain/entities/userbank.dart';

abstract class LoginRepositoryInterface {
  Future<String> login(String email, String password);
  Future<String> saveUser(UserBank user);
  Future<String> verifyUser();
}
