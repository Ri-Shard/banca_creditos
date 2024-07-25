import 'package:banca_creditos/domain/entities/userbank.dart';
import 'package:banca_creditos/domain/repositories/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginReprositoryImpl extends LoginRepositoryInterface {
  final supabase = Supabase.instance.client;

  @override
  Future<String> login(String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return 'Bienvenido';
    } catch (e) {
      return 'Credenciales Erroneas';
    }
  }

  @override
  Future<String> saveUser(UserBank user) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: user.email,
        password: user.password,
      );
      // print(res);

      final response = await supabase.from('userbank').insert(user.toJson());

      // final User? user = res.user;
      return 'Guardado';
    } catch (e) {
      return 'Error al guardar';
    }
  }

  @override
  String verifyUser() {
    User? auxUser = supabase.auth.currentUser;
    if (auxUser == null) {
      return 'login';
    } else {
      return 'logged';
    }
  }
}
