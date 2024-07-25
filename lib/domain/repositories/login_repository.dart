import 'package:banca_creditos/domain/entities/userbank.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginRepositoryInterface {
  Future<String> login(String email, String password);
  Future<String> saveUser(UserBank user);
  Future<UserBank> getUser(User usersearch);
  String verifyUser();
}
